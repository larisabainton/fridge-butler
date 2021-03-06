class FridgesController < ApplicationController
  def index
    @user = current_user
    @fridge = @user.fridge
    @grocerylist = @user.grocerylist
  end

  def show
    @user = current_user
    @fridge = @user.fridge
    @fridgecategories = @fridge.fridgecategories.order(name: :asc)
    @fridgecategory = Fridgecategory.new
    @grocery = Grocery.new
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
      redirect_to new_grocerylist_path
    else
      flash[:notice] = @fridge.errors.full_messages.join(', ')
      render 'new'
    end
  end

  def edit
    @fridge = Fridge.find(params[:id])
    if current_user != @fridge.user
      flash[:notice] = 'You cannot edit this fridge'
      redirect_to fridge_path(@fridge)
    end
  end


  def update
    @fridge = Fridge.find(params[:id])

    if @fridge.update_attributes(fridge_params)
      flash[:notice] = "Fridge edited successfully"
      redirect_to fridge_path(@fridge)
    else
      flash[:notice] = @fridge.errors.full_messages.join(', ')
      render 'edit'
    end
  end

  private

  def fridge_params
    params.require(:fridge).permit(:name)
  end
end
