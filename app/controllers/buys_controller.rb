class BuysController < ApplicationController
  def index
    @buy_address = BuyAddress.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_address = BuyAddress.new(buy_params)
    @buy_address.valid?
    @buy_address.save
      redirect_to root_path
  end

  private

  def buy_params
    params.require(:buy_address).permit(:zip_code, :prefecture_id, :city, :house_num, :building, :phone).merge(item_id: @item.id, user_id: current_user.id)
  end
end