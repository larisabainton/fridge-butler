class FridgecategoriesController < ApplicationController
  def new
    if user_signed_in?
      @fridgecategory = Fridgecategory.new
    else
      flash[:notice] = "Please sign in"
      redirect_to new_user_session_path
    end
  end

  def create
    @fridgecategory = Fridgecategory.new(fridgecategory_params)
    @user = current_user
    @fridge = @user.fridge
    @fridgecategory.fridge = @fridge

    if @fridgecategory.save
      flash[:notice] = "Category added successfully"
      redirect_to fridge_path(@fridge)
    else
      flash[:notice] = @fridgecategory.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def update
  end

  def delete
  end

  private

  def fridgecategory_params
    params.require(:fridgecategory).permit(:name)
  end
end
