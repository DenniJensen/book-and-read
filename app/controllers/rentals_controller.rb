class RentalsController < ApplicationController
  before_action :set_rental, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  def index
    @rentals = Rental.where(owner_id: params[:user_id])
  end

  def show
  end

  def edit
  end

  def create
    @rental = Rental.from(params[:borrow_request_id])
      if @rental.save
        BorrowRequest.delete(params[:borrow_request_id])
        redirect_to controller: :borrow_requests, action: :index, user_id: current_user.id,
          notice: 'Rental was successfully created.'
      else
         render :show
      end
  end

  def update
    respond_to do |format|
      if @rental.update(rental_params)
        format.html { redirect_to @rental, notice: 'Rental was successfully updated.' }
        format.json { render :show, status: :ok, location: @rental }
      else
        format.html { render :edit }
        format.json { render json: @rental.errors, status: :unprocessable_entity }
      end
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
  # Use callbacks to share common setup or constraints between actions.
  def set_rental
    @rental = Rental.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def rental_params
    params.require(:rental).permit(:start, :end, :borrower, :owner, :book)
  end
end
