class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  add_breadcrumb "Startseite", :root_path
  add_breadcrumb "Verleihe", :user_rentals_path

  def index
    @rentals = Rental.where(owner_id: params[:user_id])
  end

  def show
    add_breadcrumb "Aktuell verliehen", :user_rental_path
  end

  def create
    @rental = Rental.from(params[:borrow_request_id])
    if @rental.save
      BorrowRequest.delete(params[:borrow_request_id])
      redirect_to controller: :borrow_requests,
        action: :index,
        user_id: current_user.id,
        notice: 'Rental was successfully created.'
    else
       render :show
    end
  end

  def destroy
    @rental.destroy
    respond_to do |format|
      format.html { redirect_to rentals_url, notice: 'Rental was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_rental
    @rental = Rental.find(params[:id])
  end

  def user_params
    params.permit(:user_id)
  end
end
