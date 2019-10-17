class RemoveNicknamemFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :nicknamem, :string
  end
end
