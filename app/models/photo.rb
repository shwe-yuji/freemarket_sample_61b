class Photo < ApplicationRecord
  belongs_to :product, optional: true
  mount_uploader :photo, ImageUploader
end
