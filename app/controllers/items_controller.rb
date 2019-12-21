class ItemsController < ApplicationController
  before_action :item_params, only: [:index, :show, :edit, :destroy]

  def index
    @items = Item.find(item_params[:id]).limit(10).order('created_at DESC')
    @images = Image.find(item_params[:id])
    @image = Image.find(item_id: image_params)
  end
  def show
    @category = Category.find(params[:id])
    @images = Image.find(item_params[:id])
    @brand = Brand.find(params[:id])
    @items = Item.find(item_params[:id])
  end
  
  private
  def item_params
    @item = Item.find(params[:id])
  end
  def image_params
    @image = Image.find(params[:id])
  end
end
