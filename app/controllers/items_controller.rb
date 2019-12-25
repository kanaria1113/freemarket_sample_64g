class ItemsController < ApplicationController

  
  def index
    @items = Item.all
  end
  def edit
    @item = Item.find(1)
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
    if @item.user_id == current_user.id && @item.update
      chenge_item_items_path
    else
      chenge_item_items_path
    end
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

