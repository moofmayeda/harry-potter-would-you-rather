class Picture < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  validates_uniqueness_of :title
end