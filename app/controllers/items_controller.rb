class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :search, :search_category]
  before_action :item_search, only:[:index, :search_category, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
    redirect_to action: :index unless @item.user_id == current_user.id
  end

  def update
    if @item.update(item_edit_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy if @item.user_id == current_user.id  
    redirect_to root_path
  end

  def search
    @items = Item.search(params[:keyword])
  end

  def search_category
    @results = @i.result
  end

  private
  def item_search
    @i = Item.ransack(params[:q])
  end

  def item_params
    params.require(:item).permit(:name, :content, :price, :joint_buying_id, :category_id, :prefecture_id, :image, :shipping_method_id, :exhibit_number).merge(user_id: current_user.id)
  end

  def set_item
    @item  = Item.find(params[:id])
  end


  def item_edit_params
    params.require(:item).permit(:name, :content,:category_id, :prefecture_id, :image, :shipping_method_id).merge(user_id: current_user.id)
  end
end
