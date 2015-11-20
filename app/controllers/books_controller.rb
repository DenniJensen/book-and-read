class BooksController < ApplicationController
  before_action :assign_user, only: [:add_book_to_user, :index,
                                     :remove_book_from_user]
  before_action :assign_book, only: [:add_book_to_user, :show,
                                     :remove_book_from_user]
  def index
    @books = @user.books
  end

  def show
  end

  def search
    @searched_for = params[:name]
    @books = Book.first(2)
    render 'index'
  end

  def owners
    @book = Book.find_by(params[:books_id])
    @users = @book.owners if @book
    render 'users/index'
  end

  def all_books
    @books = Book.all
    render 'books/index'
  end

  def add_book_to_user
    @user.books << @book
    render nothing: true
  end

  def remove_book_from_user
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
