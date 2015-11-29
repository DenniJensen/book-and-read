class BorrowRequestsController < ApplicationController
  add_breadcrumb "Startseite", :root_path
  before_action :set_breadcrumb, except: :new

  before_action :authenticate_user!

  def index
    @borrow_requests = BorrowRequest.where(requester_id: params[:user_id])
    @lent_request = BorrowRequest.where(owner_id: params[:user_id])
  end

  def show
    add_breadcrumb "Anfrage", :user_borrow_request_path
    @borrow_request = BorrowRequest.find(params[:id])
  end

  def edit
    add_breadcrumb "Anfrage editieren", :user_borrow_request_path
  end

  def new
    add_breadcrumb "Bücher", :user_books_path
    add_breadcrumb "Buchbesitzer", :user_book_path
    add_breadcrumb "Ausleihanfrage", :new_user_book_borrow_request_path
    @borrow_request = BorrowRequest.new(user_borrow_request)
  end

  def create
    @borrow_request = BorrowRequest.new(borrow_request_params)
    if @borrow_request.save
      flash[:notice] = "Anfrage gesendet"
      redirect_to url_for(controller: :home, action: :index)
    else
      flash[:alert] = 'Anfrage fehlgeschlagen'
      redirect_to url_for(controller: :home, action: :index)
    end
  end

  def destroy
    BorrowRequest.find(params[:id]).delete
    redirect_to action: :index, status: 303
  end

  private

  def borrow_request_params
    params.require(:borrow_request).permit(
      :requester_id, :book_id, :owner_id, :borrow_start, :borrow_end
    )
  end

  def user_borrow_request
    {
      requester_id: params[:requester_id],
      book_id: params[:book_id],
      owner_id: params[:user_id]
    }
  end

  def set_breadcrumb
    add_breadcrumb "Anfragen", :user_borrow_requests_path
  end
end
