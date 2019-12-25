class ItemsController < ApplicationController
  def index
    @items = Item.all
  end
  def edit
    @item = Item.find(params[:id])
    @image = @item.images.build
    @image = Image.find(params[:id])
  end
  def show
    @category = Category.find(params[:id])
    @images = Image.all
    @brand = Brand.find(params[:id])
    @item = Item.find(item_params[:id])
  end
  def update
    if @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to chenge_item_items_path
    else 
  end
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to mypage_index_path
  end
  def chenge_item
    @item = Item.find(params[:id])
    @image = Image.find(params[:id])
    @images = @item.images
  end
  private
  def item_params
    params.require(:item).permit(:name,:price,:description,:status,:region,:burden,:date,:send_method,images_attributes: [:id,:image])
  end
end

