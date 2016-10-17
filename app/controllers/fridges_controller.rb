class FridgesController < ApplicationController
  def index
    if user_signed_in?
      @user = current_user
      @fridge = @user.fridge
    else
      redirect_to new_user_session_path
    end
  end

  def show
    @user = current_user
    @fridge = @user.fridge
  end

  def new
    if user_signed_in?
      @fridge = Fridge.new
    else
      flash[:notice] = "Please sign in"
      redirect_to new_user_session_path
    end
  end

  def create
    @fridge = Fridge.new(fridge_params)
    @fridge.user = current_user

    if @fridge.save
      flash[:notice] = "Fridge created successfully"
      redirect_to fridges_path
    else
      flash[:notice] = @fridge.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def update
  end

  def delete
  end

  private

  def fridge_params
    params.require(:fridge).permit(:name)
  end
end
