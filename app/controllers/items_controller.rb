class ItemsController < ApplicationController
  
  def index
    @items =Item.all
  end
  
  def new
    @item = Item.new
  end

  def create
    @item =Item.new(item_params)
  end

  private 
  def item_params
    params.require(:item)
    .permit(:name, :profile, :category_id,:status_id, :delivery_fee_id, :prefecture_id, :shipment_days_id, :fee, :image)
    .merge(user_id: current_user.id)
  end
end
