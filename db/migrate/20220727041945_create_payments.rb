class CreatePayments < ActiveRecord::Migration[7.0]
  def change
    create_table :payments do |t|
      t.string :name
      t.string :contact_number
      t.decimal :amount
      t.string :description
      t.string :address
      t.string :postal_code
      t.string :city
      t.string :state
      t.string :country
      t.integer :transaction_number
      t.references :escrows, null: false, foreign_key: true

      t.timestamps
    end
  end
end
