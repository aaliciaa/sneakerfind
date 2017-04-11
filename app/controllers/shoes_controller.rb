class ShoesController < ApplicationController
  def index
    @shoes = Shoe.all
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
