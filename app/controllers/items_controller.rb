class ItemsController < ApplicationController

  def index
    @items =Item.all.order("created_at DESC")
  end
  
  def new
    # @user = current_user
    @item = Item.new
  end

  def create
    # @user = current_user.id
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end



  private 
  def item_params
    params.require(:item)
    .permit(:name, :profile, :category_id,:status_id, :delivery_fee_id, :prefecture_id, :shipment_days_id, :fee, :image, :category_id, :status_id, :delivery_fee_id, :prefecture_id, :shipment_days_id )
    .merge(user_id: current_user.id)
  end

end
