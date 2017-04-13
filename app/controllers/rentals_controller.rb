class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
    # prepopulate the rental.new with the cookie data (dates)
    @rental.start_date = Date.parse(session[:start_date])
    @rental.end_date = Date.parse(session[:end_date])
    @shoe = Shoe.find(params[:shoe_id])
    @rental.shoe =  @shoe
    @rental.total_cost = (@rental.end_date - @rental.start_date) * @shoe.unit_price
  end

  def create
    @rental = Rental.new
    @rental.start_date = Date.parse(session[:start_date])
    @rental.end_date = Date.parse(session[:end_date])
    @shoe = Shoe.find(params[:shoe_id])
    @rental.shoe = @shoe
    @rental.status = "pending"
    @rental.total_cost = (@rental.end_date - @rental.start_date) * @shoe.unit_price
    @rental.renter = current_user

    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  private

  def rental_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
