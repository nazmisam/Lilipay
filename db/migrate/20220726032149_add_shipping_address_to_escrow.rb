class AddShippingAddressToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :shipping_attention, :string
    add_column :escrows, :shipping_address, :string
    add_column :escrows, :shipping_postal, :string
    add_column :escrows, :shipping_city, :string
    add_column :escrows, :shipping_state, :string
    add_column :escrows, :shipping_country, :string
  end
end
