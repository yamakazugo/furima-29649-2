class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :create]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  def index
    @items = Item.includes(:user).order("created_at DESC")
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
  end

  def edit
  end

  def update
    if item.update(item_params)
      redirect_to root_path
    else 
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id  
      @item.destroy
      redirect_to root_path
    else 
      render :show
    end
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :schedule_delivery_id, :price ).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
