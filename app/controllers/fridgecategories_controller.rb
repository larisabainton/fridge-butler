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

  def edit
    @fridgecategory = Fridgecategory.find(params[:id])
    @fridge = @fridgecategory.fridge
    if current_user != @fridge.user
      flash[:notice] = 'You cannot edit this category'
      redirect_to root_path
    end
  end

  def update
    @fridgecategory = Fridgecategory.find(params[:id])
    @fridge = @fridgecategory.fridge
    if @fridge.user == current_user
      if @fridgecategory.update_attributes(fridgecategory_params)
        flash[:notice] = "Category edited successfully"
        redirect_to @fridge
      else
        flash[:notice] = @fridgecategory.errors.full_messages.join(', ')
        render 'edit'
      end
    else
      flash[:notice] = 'You do not have permission to edit this category'
      redirect_to root_path
    end
  end

  def destroy
    @fridgecategory = Fridgecategory.find(params[:id])
    @fridge = @fridgecategory.fridge
    if @fridge.user == current_user
      @fridgecategory.destroy
      redirect_to @fridge
    else
      flash[:notice] = 'You do not have permission to edit this category'
      redirect_to root_path
    end
  end

  private

  def fridgecategory_params
    params.require(:fridgecategory).permit(:name)
  end
end
