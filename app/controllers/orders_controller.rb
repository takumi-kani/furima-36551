class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, :redirect_root
  def index
    set_item
    @order_buyer = OrderBuyer.new
  end

  def create
    set_item
    @order_buyer = OrderBuyer.new(order_params)
    if @order_buyer.valid?
      pay_item
      @order_buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def redirect_root
    if @item.order.present? && current_user.id != @item.user_id || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def order_params
    params.require(:order_buyer).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end