class ItemsController < ApplicationController

  before_action :set_item, only: [:index, :show, :edit, :destroy, :buyscreen, :buyscreenitem]
  def index
    @items = Item.find(set_item[:id]).limit(10).order('created_at DESC')
    @images = Image.find(set_item[:id])
    @image = Image.find(item_id: image_params)
    @item = Item.find(set_item[:id])
    @item.update( buyer_id: current_user.id)
  end

  def new
    @item = Item.new
    @item.images.build
    @item.item_categories.build
    @item.brands.build
  end

  def show
    @category = Category.find(params[:id])
    @images = Image.where(item_id:@item.id)
    @image = @images
    @brand = Brand.find(params[:id])
    @user = User.find(@item.seler_id)
  end
  def buyscreen
    @images = Image.where(item_id:@item.id)
    @image = @images[0]
    @addresses = Address.where(user_id: current_user.id)
    @address = @addresses[0]
    if @item.seler_id == current_user.id
      redirect_to edit_item_path
    else
    end
    @item.buyer_id = current_user.id
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

  def update
    @item = Item.find(params[:id])
    if @item.update!(update_item_params)
      # params[:images][:image].each do |image|
      #   @item.images.create!(image: image, item_id: @item.id)
      # end
      redirect_to before_edit_item_path(params[:id]), notice: "編集しました"
      else
    end

  end
  def edit
    @item = Item.find(params[:id])
  end

  def before_edit
    @item = Item.find(params[:id])
    @images = Image.where(item_id:@item.id)
    @image = @images
    @brand = Brand.find(params[:id])
    @user = User.find(@item.seler_id)
    @category = Category.find(params[:id])
  end

  def destroy
    if @item.seler_id == current_user.id &&@item.destroy
      redirect_to mypage_index_path
    else
      redirect_to edit_item_path
    end
  end
  private
  def set_item
    @item = Item.find(params[:id])
  end

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
      item_categories_attributes: [:category_id],
      brands_attributes: [:name]).merge(seler_id: current_user.id)
  end

  def update_item_params
    params.require(:item).permit(
      :name,
      :price,
      :description,
      :date,
      :status,
      :burden,
      :send_method,
      :region,
      item_categories_attributes: [:category_id, :_destroy],
      brands_attributes: [:name, :_destroy],
      images_attributes: [:image, :_destroy]).merge(seler_id: current_user.id)
  end



  def image_params
    @image = Image.find(params[:id])
  end
end
  