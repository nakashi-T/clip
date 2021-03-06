class Post < ApplicationRecord
  belongs_to :user
  
  validates :image, presence: true
  mount_uploader :image, ImageUploader
  validates :capture, length: { maximum: 140 }
  
  has_many :evaluations, dependent: :destroy
  accepts_nested_attributes_for :evaluations
  validates_associated :evaluations
  
  has_many :favorites, dependent: :destroy
  has_many :favoriters, through: :favorites, source: :user
  
  
  def self.search(search)
    if search
      Post.where(id: Evaluation.where("(item_title_1 = ?) OR (item_title_2 = ?) OR (item_title_3 = ?)", "#{search}", "#{search}", "#{search}"))
    else
      Post.all
    end
  end
  
end

# item_amount_1のカラムの降順
# posts.includes(:evaluations).order("evaluations.item_amount_1 DESC")