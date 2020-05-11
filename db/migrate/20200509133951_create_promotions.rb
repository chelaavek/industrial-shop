class CreatePromotions < ActiveRecord::Migration[6.0]
  def change
    create_table :promotions do |t|
      t.string :title
      t.text :promotion_terms
      t.timestamps
    end
  end
end
