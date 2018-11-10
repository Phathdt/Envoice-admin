class CreateAccessRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :access_requests do |t|
      t.string :company_name
      t.string :legal_representative
      t.string :phone_number
      t.string :tax_identification_number
      t.string :address
      t.string :email
      t.string :token

      t.timestamps
    end
  end
end
