class Post < ApplicationRecord
  belongs_to :user
  
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  
  has_many :evaluations
  accepts_nested_attributes_for :evaluations
  
  has_many :favorites
  has_many :favoriters, through: :favorites, source: :user
  
  
  def self.search(search)
    if search
      Post.where(id: Evaluation.where("(item_title_1 = ?) OR (item_title_2 = ?) OR (item_title_3 = ?)", "#{search}", "#{search}", "#{search}"))
    else
      Post.all
    end
  end
  
end
