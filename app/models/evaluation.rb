class Evaluation < ApplicationRecord
  belongs_to :post
  
  validates :item_title_1, presence: true
  validates :item_amount_1, presence: true
  
  def change
    create_table :posts do |t|
      t.float :item_amount_1
    end
  end
end
