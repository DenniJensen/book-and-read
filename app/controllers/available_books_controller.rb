class AvailableBooksController < ApplicationController
  def index
    @books = Book.joins(:book_ownerships)
      .where.not(book_ownerships: { user_id: nil })
    render 'books/index'
  end
end
