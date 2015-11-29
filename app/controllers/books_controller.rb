class BooksController < ApplicationController
  before_action :assign_user, only: [:index, :create, :destroy]
  before_action :assign_book, only: [:show, :create, :destroy]

  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Verfügbare Bücher", :available_books_path

  before_action :authenticate_user!

  def index
    @books = @user.books
  end

  def show
    add_breadcrumb "#{@book.title}", :book_path
  end

  def new
    add_breadcrumb "Buchbesitzer", :user_book_path
    add_breadcrumb "Ausleihanfrage", :new_user_book_borrow_request_path
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
