class PurchasesController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    @price = @item.price
    @count = @item.exhibit_number
    @count.times do
      @price = @price*= 0.95
    end
  end
end
