class AddPublicAddressToCompany < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :public_address, :string
    add_index :companies, :public_address, unique: true
  end
end
