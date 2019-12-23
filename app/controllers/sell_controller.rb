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
      params[:images][:image].each do |image|
        @item.images.create!(image: image, item_id: @item.id)
      end
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
      :date,
      :status,
      :burden,
      :send_method,
      :region,
      images_attributes: [:image])
  end

  def set_params
    @item = Item.find(params[:id])
  end
end
