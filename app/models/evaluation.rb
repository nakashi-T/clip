class Evaluation < ApplicationRecord
  belongs_to :post
  
  validates :item_title_1, presence: true
  validates :item_amount_1, presence: true
end
