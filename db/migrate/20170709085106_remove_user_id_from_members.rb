class RemoveUserIdFromMembers < ActiveRecord::Migration[5.0]
  def change
    remove_column :members, :User_id, :integer
  end
end
