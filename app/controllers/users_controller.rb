class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
    user = User.find(params[:id])
    @nickname = user.nickname
    @items = Item.where(user_id: current_user.id)
    @ordered_items = Item.joins(:orders).where(joint_buying_id: 0)
    @purchased_items = Item.joins(:purchases)
  end
end
