class UsersController < ApplicationController

  before_action :is_matching_login_user, only: [:edit, :update]
  def index
    @user = current_user
    @new_book = Book.new
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @new_book = Book.new
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])

  end


  def is_matching_login_user
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

end

private
def user_params
  params.require(:user).permit(:name, :email)
end
