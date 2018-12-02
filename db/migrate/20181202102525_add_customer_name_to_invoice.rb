class AddCustomerNameToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :customer_name, :string
  end
end
