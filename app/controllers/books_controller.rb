class BooksController < ApplicationController
  before_action :assign_user, only: [:index, :create, :destroy]
  before_action :assign_book, only: [:show, :create, :destroy]

  def index
    @books = @user.books
  end

  def show
  end

  def new
    @books = Book.all
  end

  def create
    @user.books << @book
    render nothing: true
  end

  def destroy
    @user.books.delete(@book)
    render nothing: true
  end

  private

  def assign_user
    @user = User.find params[:user_id]
  end

  def assign_book
    @book = Book.find params[:id]
  end
end
