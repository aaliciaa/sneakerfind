class UsersController < ApplicationController
  def show
    @user = current_user
    @rentals = Rental.where(renter_id: 28)
    @shoes = Shoe.where(owner: 28)
    @shoes_on_loan = Shoe.where(owner: 28, available: false)
  end
end
