class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :update]
  before_action :find_item, only: [:edit, :update]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to item_path(@item)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @item = Item.find(params[:id])
    if current_user && @item.user_id == current_user.id
      # 編集画面を表示
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,
                                 :delivery_day_id, :price, :image).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
