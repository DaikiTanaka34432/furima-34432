class OrdersController < ApplicationController

  def index
  end

  def new
    @order_address = OrderAddress.new
  end
   
  def create
    @order_address = OrderAddress.create(oreder_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def oreder_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :house_name, :telephone, :item ).merge(user_id: current_user.id)
  end
end
