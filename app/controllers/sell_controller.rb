class SellController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @image = Image.new
   end

  def create
    @item = Item.new(item_params)
    @image = Image.new(image_params)
    if @item.save!
      item = Item.find(@item.id)
      image_id = Image.find(@item.id).id
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
      :created_at,
      :updated_at
    ).merge(buyer_id: current_user.id)
  end

  def image_params
    params.require(:images).require(:image).permit(params[:images][:image].keys) if params[:images].present?
  end

end
