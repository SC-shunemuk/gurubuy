class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
  end
  private
  def item_params
    params.require(:item).permit(:name, :content, :price, :joint_buying, :category_id, :status_id, :bear_price_id, :prefecture_id, :shipping_day_id).merge(user_id: current_user.id)
  end
end
