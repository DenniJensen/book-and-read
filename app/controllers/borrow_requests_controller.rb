class BorrowRequestsController < ApplicationController
  def index
    @borrow_requests = BorrowRequest.where(requester_id: params[:user_id])
  end

  def create
    BorrowRequest.create(
      owner_id: params[:user_id],
      requester_id: params[:requester_id],
      book_id: params[:book_id]
    )
    render nothing: true
  end
end
