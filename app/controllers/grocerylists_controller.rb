class GrocerylistsController < ApplicationController
  def show
    @user = current_user
    @grocerylist = @user.grocerylist
    @groceries = @grocerylist.groceries
    @fridgecategories = @user.fridgecategories.order(name: :asc)
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

  def edit
    @grocerylist = Grocerylist.find(params[:id])
    if current_user != @grocerylist.user
      flash[:notice] = 'You cannot edit this grocery list'
      redirect_to @grocerylist
    end
  end


  def update
    @grocerylist = Grocerylist.find(params[:id])
    if @grocerylist.user == current_user
      if @grocerylist.update_attributes(grocerylist_params)
        flash[:notice] = "Grocery List edited successfully"
        redirect_to @grocerylist
      else
        flash[:notice] = @grocerylist.errors.full_messages.join(', ')
        render 'edit'
      end
    else
      flash[:notice] = 'You do not have permission to edit this grocery list'
      redirect_to @grocerylist
    end
  end

  private

  def grocerylist_params
    params.require(:grocerylist).permit(:name)
  end
end
