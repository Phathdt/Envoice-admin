class AddPublicAddressToAccessRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :access_requests, :public_address, :string
    add_index :access_requests, :public_address, unique: true
  end
end
