class BuyController < ApplicationController
  before_action :set_item
  before_action :authenticate_user!

  def buyscreen
    @item = Item.find(params[:id])
    @images = Image.where(item_id:@item.id)
    @image = @images[0]
    @addresses = Address.where(user_id: current_user.id)
    @address = @addresses[0]
    if @item.seler_id == current_user.id
      redirect_to before_edit_item_path
    else
      @item.buyer_id = current_user.id
    end
    @item.save
    card = Card.find_by(user_id: current_user.id)
    if card.blank?
      redirect_to action: "new" 
    else
      Payjp.api_key = Rails.application.credentials[:"pay.jp"][:"PAYJP_PRIVATE_KEY"]
      customer = Payjp::Customer.retrieve(card.customer_id)
      @default_card_information = customer.cards.retrieve(card.card_id)
    end
  end


  def buyscreenitem
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end

  def image_params
    @image = Image.find(params[:id])
  end

end
