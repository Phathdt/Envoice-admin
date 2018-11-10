class AddIndexToAccessRequestAndCompany < ActiveRecord::Migration[5.2]
  def change
    add_index :access_requests, :email, unique: true
    add_index :companies, :email, unique: true
  end
end
