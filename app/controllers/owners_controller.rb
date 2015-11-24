class OwnersController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Verfügbare Bücher", :available_books_path
  add_breadcrumb "Buchbesitzer", :book_owners_path

  def index
    @book = Book.find(params[:book_id])
    @users = @book.owners if @book
    render 'users/index'
  end

  def show
    add_breadcrumb "Buchbesitzer", :book_owner_path
    @book = Book.find(params[:book_id])
    @users = @book.owners if @book
  end
end
