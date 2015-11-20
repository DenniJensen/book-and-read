class BooksController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @books = @user.books
  end

  def show
    @book = Book.find params[:id]
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
end
