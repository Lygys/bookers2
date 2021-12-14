class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = Book.where(user_id: @user)
  end

  def edit
    @user = User.find(params[:id])
    redirect_to root_path unless @user.id == current_user.id
  end

  def update
    @user = User.find(params[:id])
    if
      if @user.update(user_params)
        redirect_to user_path(@user), notice: "User profile was successfully updated."
      else
        render 'users/edit'
      end
    else
      redirect_to root_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
