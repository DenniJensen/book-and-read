class BorrowRequestsController < ApplicationController
  def index
    @borrow_requests = BorrowRequest.where(requester_id: params[:user_id])
    @lent_request = BorrowRequest.where(owner_id: params[:user_id])
  end

  def show
    @borrow_request = BorrowRequest.find(params[:id])
  end

  def create
    created = BorrowRequest.create(
      owner_id: params[:user_id],
      requester_id: params[:requester_id],
      book_id: params[:book_id]
    )
    if created
      flash[:notice] = "Anfrage gesendet"
      render 'home/index'
    else
      flash[:alert] = "Anfrage konnte nicht übergeben werden"
      render nothing: true
    end
  end
end
