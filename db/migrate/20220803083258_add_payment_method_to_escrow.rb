class AddPaymentMethodToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :payment_method, :string
  end
end
