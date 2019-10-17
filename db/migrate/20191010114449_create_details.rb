class CreateDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :details do |t|
      t.string :large_category, null: false, index: true
      t.string :medium_category, index: true
      t.string :small_category, index: true
      t.string :size, index: true
      t.string :brand, index: true
      t.references :product, null:false, foreign_key: true
      t.timestamps
    end
  end
end
