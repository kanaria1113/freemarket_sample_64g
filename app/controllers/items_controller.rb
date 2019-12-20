class ItemsController < ApplicationController
  def index
    
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
      redirect_to mypage_index_path
  end
end