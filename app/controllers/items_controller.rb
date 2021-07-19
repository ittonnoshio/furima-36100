class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, only: :edit
  before_action :set_item, only: [:show, :edit, :update, :move_to_index]

  def index
    @items = Item.includes(:user).order('created_at DESC')
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
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def move_to_index
    redirect_to root_path unless current_user.id == item.user_id
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :state_id, :shipping_fee_id, :prefecture_id,
                                 :shipping_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
