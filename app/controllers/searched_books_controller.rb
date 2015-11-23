class SearchedBooksController < ApplicationController
  def create
    @searched_for = params[:search]
    @books = Book.search(@searched_for)
    render 'searched_books/index'
  end
end
