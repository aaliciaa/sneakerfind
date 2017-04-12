class Shoe < ApplicationRecord
  belongs_to :owner, class_name: "User"
  has_many :rentals

  mount_uploader :photo, ShoePhotoUploader

  geocoded_by :owner_location
  after_validation :geocode

  def owner_location
    owner.location
  end
end
