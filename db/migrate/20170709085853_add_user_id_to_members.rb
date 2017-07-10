class AddUserIdToMembers < ActiveRecord::Migration[5.0]
  def change
    add_column :members, :user_id, :integer
  end
end
