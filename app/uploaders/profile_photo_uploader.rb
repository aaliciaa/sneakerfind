# encoding: utf-8

class ProfilePhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
