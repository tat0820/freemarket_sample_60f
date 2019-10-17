class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :nickname, :string
    add_column :users, :password, :string
    add_column :users, :phone_number, :integer
  end
end
