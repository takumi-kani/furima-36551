class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :redirect_root, only: :edit
  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render new_item_path
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path
    else
      @item.update(item_params)
      render :edit
    end
  end

  private
  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end

  def redirect_root
    @item = Item.find(params[:id])
    if @item.order.present? && @item.user_id == current_user.id || @item.user_id != current_user.id
      redirect_to root_path
    end
  end
end
