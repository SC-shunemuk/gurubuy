class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @price = @item.price
    @count = @item.joint_buying.id
  end

  def create
    @price = @item.price
    @count = @item.joint_buying.id
    @order = Order.new(order_params)
    if @order.save
      render :create
    else
      render :index
    end
  end
  



  def set_item
    @item = Item.find(params[:item_id])
  end
  private

  def order_params
    params.permit(:address_code, :prefecture_id, :city, :address_number, :house_name, :tel).merge(user_id: current_user.id, item_id: @item.id)
  end
end