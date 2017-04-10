class Shoe < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rentals
end
