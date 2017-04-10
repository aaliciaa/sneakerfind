class Rental < ApplicationRecord
  belongs_to :shoe
  belongs_to :renter, class_name: "User"
end
