class AddStatusToPaymentrelease < ActiveRecord::Migration[7.0]
  def change
    add_column :paymentreleases, :status, :integer, default: 0
  end
end
