class AddPaidAmountToInvoice < ActiveRecord::Migration[5.2]
  def change
    add_column :invoices, :paid_amount, :decimal, default: 0
  end
end
