class UsersController < ApplicationController

    before_action :is_matching_login_user, only: [:edit, :update]
  def index
  end

  def show
    @book = Book.new
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])

  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end
