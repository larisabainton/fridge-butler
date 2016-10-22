class GrocerylistsController < ApplicationController
  def show
    @user = current_user
    @grocerylist = @user.grocerylist
    @groceries = @grocerylist.groceries
    @fridgecategories = @user.fridgecategories
    @grocery = Grocery.new
  end

  def new
    if user_signed_in?
      @grocerylist = Grocerylist.new
    else
      flash[:notice] = "Please sign in"
      redirect_to new_user_session_path
    end
  end

  def create
    @grocerylist = Grocerylist.new(grocerylist_params)
    @grocerylist.user = current_user

    if @grocerylist.save
      flash[:notice] = "Grocery list created successfully"
      redirect_to new_fridgecategory_path
    else
      flash[:notice] = @grocerylist.errors.full_messages.join(', ')
      render 'new'
    end
  end

  private

  def grocerylist_params
    params.require(:grocerylist).permit(:name)
  end
end
