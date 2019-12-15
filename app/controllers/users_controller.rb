class UsersController < ApplicationController
  def index
  end

  def create
    @user = User.new
  end

  def registration_index
  end

  def login
  end
end
