class ItemsController < ApplicationController
  # before_action :item_params, only: [:index,:show, :edit, :update,:destroy]
  def index
    @items = Item.all
  end
  def edit
    @item = Item.find(1)
    @image = Image.find(params[:id])
    @item.images.build
  end
  def show
    @category = Category.find(params[:id])
    @images = Image.all
    @brand = Brand.find(params[:id])
    @item = Item.find(item_params[:id])
  end
  def update
    @seler = current_user
    @item = Item.find(params[:id])
    @item.update(item_params)
    binding.pry
      redirect_to chenge_item_items_path
  end
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to mypage_index_path
  end
  def chenge_item
    @item = Item.find(1)
    @image = Image.find(1)
    @images = @item.images
  end
  private
  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:region,:burden,:date,:send_method,images_attributes: [:id,:image])
  end
end

