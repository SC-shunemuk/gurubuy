class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      @item.decrement!(:joint_buying_id,1)
      render :create
    else
      render :index
    end
  end
  



  def set_item
    @item = Item.find(params[:item_id])
    @price = @item.price
    @count = @item.joint_buying.id - 1
  end
  private

  def order_params
    params.permit(:address_code, :prefecture_id, :city, :address_number, :house_name, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end

  def joint_buying_params
    params.require(:item).permit(:joint_buying_id)
  end
end