class GroceriesController < ApplicationController
  def index
    @user = current_user
    @fridge = @user.fridge
    @groceries = @fridge.groceries.where(grocerylist_id: nil).order(name: :asc)
  end

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
    @fridgecategories = @fridge.fridgecategories
    @grocerylist = @user.grocerylist

    if @grocery.save
      flash[:notice] = "Grocery added successfully"
      if @grocery.exp_date.nil?
        @grocery.update_attributes(grocerylist_id: @grocerylist.id)
        redirect_to grocerylist_path(@grocerylist)
      else
        redirect_to fridge_path(@fridge)
      end
    else
      flash[:notice] = @grocery.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit
    @grocery = Grocery.find(params[:id])
    @fridgecategory = @grocery.fridgecategory
    @fridge = @fridgecategory.fridge
    @fridgecategories = @fridge.fridgecategories

    if current_user != @fridge.user
      flash[:notice] = 'You cannot edit this grocery'
      redirect_to root_path
    end
  end

  def update
    @grocery = Grocery.find(params[:id])
    @fridgecategory = @grocery.fridgecategory
    @fridge = @fridgecategory.fridge
    @fridgecategories = @fridge.fridgecategories
    @user = current_user
    @grocerylist = @user.grocerylist

    if @grocery.update_attributes(grocery_params)
      flash[:notice] = "Grocery edited successfully"
      if @grocery.grocerylist.nil?
        redirect_to fridge_path(@fridge)
      else
        redirect_to @grocerylist
      end
    else
      flash[:notice] = @grocery.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    @fridgecategory = @grocery.fridgecategory
    @fridge = @fridgecategory.fridge
    if @fridge.user == current_user
      @grocery.destroy
      redirect_to fridge_path(@fridge)
    else
      flash[:notice] = 'You do not have permission to edit this grocery'
      redirect_to root_path
    end
  end

  def accept
    @user = current_user
    @grocery = Grocery.find(params[:id])
    @grocerylist = @grocery.grocerylist

    if !@grocery.grocerylist_id.nil?
      @grocery.update_attributes(grocerylist_id: nil)
      flash[:notice] = 'You have added your grocery to your fridge'
      redirect_to @grocerylist
    else
      flash[:notice] = 'This grocery is not in the grocerylist'
      redirect_to root_path
    end
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :quantity, :exp_date, :fridgecategory_id, :grocerylist_id)
  end
end
