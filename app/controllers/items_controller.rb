class ItemsController < ApplicationController
  def edit
    @item = Item.find(1)
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to mypage_index_path
  end
end