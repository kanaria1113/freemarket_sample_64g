class SellController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.build
   end

  def create
    @item = Item.new(item_params)
    if @item.save!
      item = Item.find(@item.id)
      redirect_to root_path, notice: "出品しました"
      else
    end
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      :status,
      :burden,
      :send_method,
      :region,
      images_attributes: [:image])
  end
end
