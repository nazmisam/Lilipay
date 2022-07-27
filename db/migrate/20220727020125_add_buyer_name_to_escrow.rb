class AddBuyerNameToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :buyer_name, :string
    add_column :escrows, :buyer_email, :string
    add_column :escrows, :contact_number, :string
    add_column :escrows, :total_pay, :decimal
    add_column :escrows, :transaction_number, :integer
  end
end
