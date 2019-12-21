class ItemsController < ApplicationController
  def edit
    @item = Item.find(1)
  before_action :item_params, only: [:show, :edit, :destroy]
  def index
    @items = Item.all
  end
  def show
    @category = Category.find(params[:id])
    @images = Image.all
    @brand = Brand.find(params[:id])
    @item = Item.find(item_params[:id])
  end
  
  private
  def item_params
    @item = Item.find(params[:id])
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to mypage_index_path
  end
end