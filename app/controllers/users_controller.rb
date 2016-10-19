class UsersController < ApplicationController
  def show
    if User.find(params[:id]) == current_user
      @user = current_user
    else
      flash[:notice] = 'You can only view your own profile'
      redirect_to root_path
    end
  end

  def edit
    @user = User.find(params[:id])
    if User.find(params[:id]) != current_user
      flash[:notice] = 'You can only edit your own profile.'
      @user = current_user
      render 'show'
    end
  end

  def update
  @user = User.find(params[:id])
  if @user == current_user
    if @user.update_attributes(user_params)
      flash[:notice] = 'Profile edited successfully'
      redirect_to @user
    else
      flash[:notice] = @user.errors.full_messages.join(', ')
      render 'edit'
    end
  end
end

def destroy
  if User.find(params[:id]) == current_user
    User.find(params[:id]).destroy
    flash[:success] = "Your account has been deleted"
    redirect_to root_path
  end
end

private

def user_params
  params.require(:user).permit(:first_name, :last_name, :email)
end
end
