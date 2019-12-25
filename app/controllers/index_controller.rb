class IndexController < ApplicationController
  def index
    @items = Item.all.limit(10).order(created_at: :desc)

  end

  private

end
