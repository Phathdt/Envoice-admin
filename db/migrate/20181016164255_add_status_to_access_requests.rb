class AddStatusToAccessRequests < ActiveRecord::Migration[5.2]
  def change
    add_column :access_requests, :state, :integer, default: 0
    add_index :access_requests, :state
  end
end
