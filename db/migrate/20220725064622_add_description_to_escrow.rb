class AddDescriptionToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :description, :string
  end
end
