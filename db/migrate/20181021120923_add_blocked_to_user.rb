class AddBlockedToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :blocked, :boolean, default: false
    add_index :users, :blocked
  end
end
