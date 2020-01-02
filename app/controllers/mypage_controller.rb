class MypageController < ApplicationController
  def index
  end

  def profile
  end

  def notification
  end

  def todo
  end

  def card
  end

  def deliver_address
  end

  def exhibiting
    @item = Item.find_by(seler_id: current_user.id)
  end
  private
  def set_item
    @item = Item.find(params[:id])
  end

  def set_user
    @user = User.find(id:current_user.id)
  end
end
