class Post < ApplicationRecord
  belongs_to :user
  
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  
  has_many :evaluations
  accepts_nested_attributes_for :evaluations
  
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :user
end
