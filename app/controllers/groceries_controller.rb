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
    @fridgecategories = @fridge.fridgecategories

    if @grocery.save
      flash[:notice] = "Grocery added successfully"
      redirect_to fridge_path(@fridge)
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
    if @fridge.user == current_user
      if @grocery.update_attributes(grocery_params)
        flash[:notice] = "Grocery edited successfully"
        redirect_to @fridge
      else
        flash[:notice] = @grocery.errors.full_messages.join(', ')
        render 'edit'
      end
    else
      flash[:notice] = 'You do not have permission to edit this grocery'
      redirect_to root_path
    end
  end

  def destroy
    @grocery = Grocery.find(params[:id])
    @fridgecategory = @grocery.fridgecategory
    @fridge = @fridgecategory.fridge
    if @fridge.user == current_user
      @grocery.destroy
      redirect_to @fridge
    else
      flash[:notice] = 'You do not have permission to edit this grocery'
      redirect_to root_path
    end
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :quantity, :exp_date, :fridgecategory_id)
  end
end
