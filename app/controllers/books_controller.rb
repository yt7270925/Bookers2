class BooksController < ApplicationController

  # def new
  #   @book = Book.new
  # end

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @book.save
    redirect_to book_path #showへのリダイレクト
  end

  def index
    @book = Book.new
    @books = Book.all
  end

  def show
  end

  # ストロングパラメータ
  private

  def book_params
    params.require(:book).permit(:title, :body)
  end

end