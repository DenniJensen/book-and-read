class SearchedBooksController < ApplicationController
  def index
    @books = Book.search(params[:search])
    render 'books/index'
  end
end
