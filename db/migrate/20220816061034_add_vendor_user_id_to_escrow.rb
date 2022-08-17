class AddVendorUserIdToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :vendor_user_id, :bigint
  end
end
