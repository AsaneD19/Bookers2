class BooksController < ApplicationController


  def index
  end

  def show
    @book = Book.find(params[:id])
    @user = current_user
    @new_book = Book.new
  end

  def edit
  end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to book_path(@book.id)
    else
      render user_path(current_user)
    end
  end
end

private
def book_params
  params.require(:book).permit(:title, :body)
end
