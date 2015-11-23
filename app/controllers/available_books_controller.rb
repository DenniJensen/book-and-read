class AvailableBooksController < ApplicationController
  def index
    @books = Book.available
    render 'books/index'
  end
end
