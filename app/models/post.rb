class Post < ApplicationRecord
  belongs_to :user
  
  validates :image, presence: true
  # mount_upqloader :image, ImageUploader
end
