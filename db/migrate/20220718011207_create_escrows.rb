class CreateEscrows < ActiveRecord::Migration[7.0]
  def change
    create_table :escrows do |t|
      t.string :role
      t.string :payment_for
      t.decimal :payment_amount
      t.decimal :transaction_fees

      t.timestamps
    end
  end
end
