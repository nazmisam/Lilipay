class AddUserIdToEscrow < ActiveRecord::Migration[7.0]
  def change
    add_column :escrows, :user_id, :integer
  end
end
