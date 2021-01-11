class CreateEvaluations < ActiveRecord::Migration[5.2]
  def change
    create_table :evaluations do |t|
      t.references :post, foreign_key: true
      t.string :item_title_1
      t.integer :item_amount_1
      t.string :item_title_2
      t.integer :item_amount_2
      t.string :item_title_3
      t.integer :item_amount_3
      
      t.timestamps
    end
  end
end
