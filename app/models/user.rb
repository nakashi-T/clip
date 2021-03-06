class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 15 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 8 },
                    format: { with: /\A(?=.*?[a-z])(?=.*?[A-Z])(?=.*?[\d])\w{7,}\z/ ,
                    message: "は半角8文字英大文字・小文字・数字それぞれ１文字以上含む必要があります(例：Password123)" }
  has_secure_password
  mount_uploader :image, ImageUploader
  
  has_many :posts, dependent: :destroy
  
  has_many :relationships, dependent: :destroy
  has_many :followings, through: :relationships, source: :follow
  has_many :reverses_of_relationship, class_name: 'Relationship', foreign_key: 'follow_id', dependent: :destroy
  has_many :followers, through: :reverses_of_relationship, source: :user
  
  has_many :favorites, dependent: :destroy
  has_many :favoriteings, through: :favorites, source: :post
  
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  
  def favorite(other_post)
    self.favorites.find_or_create_by(post_id: other_post.id)
  end
  
  def unfavorite(other_post)
    favorite = self.favorites.find_by(post_id: other_post.id)
    favorite.destroy if favorite
  end
  
  def favoriteing?(other_post)
    self.favoriteings.include?(other_post)
  end
  
end
