class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
  end

  def show
    @shoe = Shoe.find(params[:id])
  end

  def create
    @shoe = Shoe.create(shoe_params)
    redirect_to shoe_path(shoe)
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
  end

  private

  def shoe_params
   params.require(:shoe).permit(:name, :brand, :size, :description, :unit_price, :photo)
  end

  def destroy
    @shoe = Shoe.find(params[:id])
    @shoe.destroy
  end

end
