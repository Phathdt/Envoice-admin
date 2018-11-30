class AddStateValidToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :nem_validate, :integer, default: 0
    add_index :invoices, :nem_validate
    add_index :invoices, :state
  end
end
