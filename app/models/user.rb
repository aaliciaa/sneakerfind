class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :shoes, foreign_key: :owner_id
  has_many :rentals, foreign_key: :renter_id
  # has_many :offers, through: :shoes, source: :rentals

  mount_uploader :photo, ProfilePhotoUploader

  # geocoded_by :location
  # after_validation :geocode, if: :location_changed?
end
