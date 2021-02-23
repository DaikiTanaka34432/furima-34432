class OrdersController < ApplicationController
  before_action :set_soldout, only:[:index, :new, :create]

  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
    if user_signed_in? 
      if current_user.id == @item.user_id 
        redirect_to root_path
      end
    else
      redirect_to root_path
    end
  end

  def new
    @order_address = OrderAddress.new
  end
   
  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item 
      @order_address.save
      return redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :house_name, :telephone)
    .merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def set_soldout
    @item = Item.find(params[:item_id])
    if @item.order.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.fee,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
