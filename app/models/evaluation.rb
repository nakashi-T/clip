class Evaluation < ApplicationRecord
  belongs_to :post
  
  validates :item_title_1, presence: true
  validates :item_amount_1, presence: true
  
  validates :item_amount_2, presence: true, if: Proc.new { |evaluation| evaluation.item_title_2.present? }
  
  
  #小数点で入力したい時に行う
  # def change
  #   create_table :posts do |t|
  #     t.float :item_amount_1
  #   end
  # end
end
