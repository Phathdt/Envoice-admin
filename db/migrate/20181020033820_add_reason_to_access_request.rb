class AddReasonToAccessRequest < ActiveRecord::Migration[5.2]
  def change
    add_column :access_requests, :reason, :string
  end
end
