class AddTrackingNumberToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :tracking_number, :string
  end
end
