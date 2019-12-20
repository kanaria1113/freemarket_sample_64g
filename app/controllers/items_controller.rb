class ItemsController < ApplicationController

  def index
    @items = Item.all
  end
  def show
    @item = Item.find(params[:id])
    @category = Category.find(params[:id])
    @images = Image.all
    @brand = Brand.find(params[:id])
  end
  
  private

  # def item_params
  #   params.require(:item).permit(
  #     :name,
  #     :status,
  #     :size,
  #     :price,
  #     :description,
  #     :burden,
  #     :send_method,
  #     :region,
  #     :date,
  #     :created_at,
  #     :updated_at,
  #     :buyer_id,
  #     :seler_id,
  #   )
  # end
end
