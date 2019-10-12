class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name, null: false, index: true
      t.text :discription
      t.string :condition, null: false, index: true
      t.string :delivery_charge, null: false, index: true
      t.string :origin_area, null: false
      t.integer :days_left_send, null:false
      t.integer :price, null: false, index: true
      t.string :status, null: false, index: true
      t.timestamps
    end
  end
end
