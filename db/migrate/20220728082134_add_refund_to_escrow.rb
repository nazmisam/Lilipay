class AddRefundToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :refund_description, :string
    add_column :escrows, :refund_reason, :string
  end
end
