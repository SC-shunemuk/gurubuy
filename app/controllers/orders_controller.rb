class OrdersController < ApplicationController
  before_action :set_item, only: :index

  def index
    price = @item.price
    @count = @item.joint_buying.id
    @count.times do |n|
      @price = price * 0.95
      price = @price
    end
  end



  def set_item
    @item = Item.find(params[:item_id])
  end
end
