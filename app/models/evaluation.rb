class Evaluation < ApplicationRecord
  belongs_to :post
  
  validates :item_title_1, presence: true
  validates :item_amount_1, presence: true
  
  validates :item_title_2, presence: true, if: Proc.new { |evaluation| evaluation.item_amount_2.present? }
  validates :item_amount_2, presence: true, if: Proc.new { |evaluation| evaluation.item_title_2.present? }
  
  validates :item_title_3, presence: true, if: Proc.new { |evaluation| evaluation.item_amount_3.present? }
  validates :item_amount_3, presence: true, if: Proc.new { |evaluation| evaluation.item_title_3.present? }
  
  #小数点で入力したい時に行う
  # def change
  #   create_table :posts do |t|
  #     t.float :item_amount_1
  #   end
  # end
end
