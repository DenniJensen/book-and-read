class BorrowRequestsController < ApplicationController
  def index
    @borrow_requests = BorrowRequest.where(requester_id: params[:user_id])
  end

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
