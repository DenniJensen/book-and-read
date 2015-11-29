class SearchedBooksController < ApplicationController
  before_action :set_variables

  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Verfügbare Bücher", :available_books_path
  add_breadcrumb "Suche"

  def index
    render 'books/index'
  end

  def create
    render 'books/index'
  end

  private

  def set_variables
    @searched_for = search_params[:search]
    @books = Book.search(@searched_for)
  end

  def search_params
    params.permit(:search)
  end
end
