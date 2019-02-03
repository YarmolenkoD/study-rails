class AddIsMaleToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :is_male, :boolean, default: false
  end
end
