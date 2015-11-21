class OwnersController < ApplicationController
  def index
    @book = Book.find_by(params[:books_id])
    @users = @book.owners if @book
    render 'users/index'
  end

  def show
    @book = Book.find_by(params[:books_id])
    @users = @book.owners if @book
  end
end
