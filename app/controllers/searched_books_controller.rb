class SearchedBooksController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Suche", :root_path

  def create
    @searched_for = params[:search]
    @books = Book.search(@searched_for)
    render 'searched_books/index'
  end
end
