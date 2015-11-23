class AvailableBooksController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Verfügbare Bücher", :available_books_path

  def index
    @books = Book.available
    render 'books/index'
  end

  def show
    add_breadcrumb "Verfügbare Bücher", :available_book_path
    @book = Book.find(params[:id])
    render 'books/show'
  end
end
