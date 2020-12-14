class OrdersController < ApplicationController
  before_action :set_item, only: :index

  def index
    @price = @item.price
    @count = @item.joint_buying.id
  end



  def set_item
    @item = Item.find(params[:item_id])
  end
end
