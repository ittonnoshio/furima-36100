class BuysController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :move_to_index, :move_to_index_soldout]
  before_action :move_to_index, only: [:index, :create]
  before_action :move_to_index_soldout, only: [:index, :create]

  def index
    @buy_address = BuyAddress.new
  end

  def create
    @buy_address = BuyAddress.new(buy_params)
    if @buy_address.valid?
      pay_item
      @buy_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  def move_to_index
    redirect_to root_path if current_user.id == @item.user_id
  end

  def move_to_index_soldout
    redirect_to root_path if current_user.id != @item.user_id && @item.buy.present?
  end

  private

  def buy_params
    params.require(:buy_address).permit(:zip_code, :prefecture_id, :city, :house_num, :building, :phone).merge(
      item_id: params[:item_id], user_id: current_user.id, token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end
end
