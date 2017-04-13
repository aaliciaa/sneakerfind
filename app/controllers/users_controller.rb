class UsersController < ApplicationController
  def show
    @user = current_user
    @rentals = Rental.where(renter_id: @user.id)
    @shoes = Shoe.where(owner: @user.id)
    @shoes_on_loan = Shoe.where(owner: @user.id, available: false)
  end
end
