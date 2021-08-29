class ItemsController < ApplicationController
  def index
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


  private
  def item_params
    params.require(:item).permit(:name, :info, :image, :category_id, :sales_status_id, :shipping_fee_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
