class AddUserIdToPaymentreleases < ActiveRecord::Migration[7.0]
  def change
    add_column :paymentreleases, :user_id, :integer
  end
end
