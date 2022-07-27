class AddVendorRoleToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :vendor_roles, :integer, default: 0
  end
end
