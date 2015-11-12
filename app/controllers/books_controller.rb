class BooksController < ApplicationController
  def index
    @books = Book.all
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
end
