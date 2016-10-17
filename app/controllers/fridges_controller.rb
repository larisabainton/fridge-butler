class FridgesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @fridge = user.fridge
    else
      redirect_to new_user_session_path
    end
  end

  def show
  end

  def new
  end

  def create
  end

  def update
  end

  def delete
  end
end
