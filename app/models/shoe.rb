class Shoe < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rentals

  mount_uploader :photo, ShoePhotoUploader

  validates :name, presence: true, uniqueness: true, length: { minimum: 3 }
  validates :description, presence: true, uniqueness: true, length: { minimum: 10 }
  validates :brand, presence: true, inclusion: { in: ["Nike", "Puma", "Supreme", "Adidas", "Yohji Yamamoto", "New Balance"], allow_nil: false }
  validates :size, presence: true
  validates :unit_price, presence: true
end
