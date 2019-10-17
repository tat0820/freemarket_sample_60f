class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :post_code, null:false
      t.string :prefecture, null:false
      t.string :town, null:false
      t.string :street, null:false
      t.string :building_name
      t.references :user, null:false, foreign_key: true
      t.timestamps
    end
  end
end
