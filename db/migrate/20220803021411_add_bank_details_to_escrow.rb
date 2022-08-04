class AddBankDetailsToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :name_on_account, :string
    add_column :escrows, :country, :string
    add_column :escrows, :currency, :string
    add_column :escrows, :bank_code, :string
    add_column :escrows, :bank_name, :string
    add_column :escrows, :account_number, :integer
  end
end
