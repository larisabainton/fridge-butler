class GroceriesController < ApplicationController

  def new
    if user_signed_in?
      @grocery = Grocery.new
    else
      flash[:notice] = "Please sign in"
      redirect_to new_user_session_path
    end
  end

  def create
    @grocery = Grocery.new(grocery_params)
    @user = current_user
    @fridge = @user.fridge

    binding.pry

    if @grocery.save
      flash[:notice] = "Category added successfully"
      redirect_to fridge_path(@fridge)
    else
      flash[:notice] = @grocery.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def update
  end

  def delete
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :quantity, :exp_date, :fridgecategory)
  end
end
