class BorrowRequestsController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Anfragen", :user_borrow_requests_path

  before_action :authenticate_user!

  def index
    @borrow_requests = BorrowRequest.where(requester_id: params[:user_id])
    @lent_request = BorrowRequest.where(owner_id: params[:user_id])
  end

  def show
    @borrow_request = BorrowRequest.find(params[:id])
  end

  def edit
  end

  def new
    @borrow_request = BorrowRequest.new
  end

  def create
    create_params = user_borrow_request.merge(borrow_request_params)
    @borrow_request = BorrowRequest.new(create_params)
    if @borrow_request.save
      flash[:notice] = "Anfrage gesendet"
      render 'home/index'
    else
      flash[:alert] = "Bereits Anfrage zum Buch vorhanden!"
      redirect_to url_for(controller: :home, action: :index)
    end
  end

  def destroy
    BorrowRequest.find(params[:id]).delete
    redirect_to action: :index, status: 303
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
