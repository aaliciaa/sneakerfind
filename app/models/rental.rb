class Rental < ApplicationRecord
  belongs_to :shoe
  belongs_to :renter, class_name: "User"

  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :total_cost, presence: true
  validates :status, presence: true, inclusion: { in: ["pending", "accepted", "declined", "complete"], allow_nil: false }
end





