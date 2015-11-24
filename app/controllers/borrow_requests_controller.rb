class BorrowRequestsController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Anfragen", :user_borrow_requests_path

  def index
    @borrow_requests = BorrowRequest.where(requester_id: params[:user_id])
    @lent_request = BorrowRequest.where(owner_id: params[:user_id])
  end

  def show
    @borrow_request = BorrowRequest.find(params[:id])
  end

  def new
    @borrow_request = BorrowRequest.new
    @places = Place.all
  end

  def create
    created = BorrowRequest.create(user_borrow_request.merge(borrow_request_params))
    if created
      flash[:notice] = "Anfrage gesendet"
      render 'home/index'
    else
      flash[:alert] = "Anfrage konnte nicht übergeben werden"
      render nothing: true
    end
  end

  private

  def borrow_request_params
    params[:borrow_request]
  end

  def user_borrow_request
    {
      requester_id: params[:requester_id],
      book_id: params[:book_id],
      owner_id: params[:user_id]
    }
  end
end
