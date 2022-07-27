class CreateEscrows < ActiveRecord::Migration[7.0]
  def change
    create_table :escrows do |t|
      t.integer :roles, default: 0
      t.string :payment_for
      t.decimal :payment_amount
      t.decimal :transaction_fees

      t.timestamps
    end
  end
end
