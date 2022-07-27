class AddStatusToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :status, :integer, default: 0
  end
end
