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

  # POST   /shoes/:shoe_id/rentals(.:format)     rentals#create
  def create
    @rental = Rental.new(user_params)
    @shoe = Shoe.new(params[:shoe_id])
    @rental.shoe = @shoe

    if @rental.save
      redirect_to rental_path(@rental)
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:rental).permit(:start_date, :end_date, :total_cost, :status)
  end
end
