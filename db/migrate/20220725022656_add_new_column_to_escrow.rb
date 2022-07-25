class AddNewColumnToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :user_email, :string
    add_column :escrows, :vendor_email, :string
  end
end
