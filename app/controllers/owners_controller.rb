class OwnersController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Verfügbare Bücher", :available_books_path
  add_breadcrumb "Buchbesitzer", :book_owners_path

  before_action :authenticate_user!

  def index
    @book = Book.find(params[:book_id])
    @users = @book.owners if @book
  end

  def show
    add_breadcrumb "Details", :book_owner_path
    @user = User.find(params[:id])
  end
end
