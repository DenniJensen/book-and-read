class SearchedBooksController < ApplicationController
  def index
    @books = Book.all
    render 'books/index'
  end
end
