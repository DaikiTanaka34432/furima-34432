class ItemsController < ApplicationController
  before_action :authenticate_user!, except:[:index, :show, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy] 
  before_action :set_edit, only: [:edit, :update, :destroy]
  before_action :set_edit_out, only:[:edit, :update, :destroy]

  def index
    @items =Item.all.order("created_at DESC")
  end
  
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to action: :index
    end
  end

  def search
    @items = Item.search(params[:keyword])
  end

  private 
  def item_params
    params.require(:item)
    .permit(:name, :profile, :category_id,:status_id, :delivery_fee_id, :prefecture_id, :shipment_days_id, :fee, :image)
    .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def set_edit
    if current_user.id != @item.user_id 
      redirect_to action: :index
    end
  end

  def set_edit_out
    if @item.order.present?
      redirect_to root_path
    end
  end
end
