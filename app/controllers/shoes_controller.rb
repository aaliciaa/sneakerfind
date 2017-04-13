class ShoesController < ApplicationController
  def index
    session[:start_date] = params[:start_date]
    session[:end_date] = params[:end_date]
    @shoes = Shoe.all
    @shoes = Shoe.where.not(latitude: nil, longitude: nil)
    @hash = Gmaps4rails.build_markers(@shoes) do |shoe, marker|
      marker.lat shoe.latitude
      marker.lng shoe.longitude
    end

  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def create
    @shoe = Shoe.new(shoe_params)
    @shoe.owner = current_user
    @shoe.available = true
    if @shoe.save
      redirect_to shoe_path(@shoe)
    else
      render :new
    end
  end

  def new
    @shoe = Shoe.new
  end

  def edit
    @shoe = Shoe.find(params[:id])
  end

  def update
    @shoe = Shoe.find(params[:id])
    @shoe.update(shoe_params)
    if @shoe.save
      redirect_to shoe_path(@shoe)
    else
      render :edit
    end
  end

  private

  def shoe_params
   params.require(:shoe).permit(:name, :brand, :size, :description, :unit_price)
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
  end

end
