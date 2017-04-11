class RentalsController < ApplicationController
  def index
    @rentals = Rental.all
  end

  def show
    @rental = Rental.find(params[:id])
  end

  def new
    @rental = Rental.new
    @shoe = Shoe.new
  end

  def create
    @rental = Rental.new(user_params)
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

  def user_params
    params.require(:rental).permit(:start_date, :end_date)
  end
end
