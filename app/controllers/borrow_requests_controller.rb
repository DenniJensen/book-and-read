class BorrowRequestsController < ApplicationController
  def create
    owner = User.find(params[:user_id])
    requester = User.find(params[:requester_id])
    book = Book.find(params[:book_id])

    BorrowRequest.create(
      owner: owner,
      requester: requester,
      book: book
    )
    render nothing: true
  end
end
