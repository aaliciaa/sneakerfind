# encoding: utf-8

class ShoePhotoUploader < CarrierWave::Uploader::Base
  include Cloudinary::CarrierWave
end
