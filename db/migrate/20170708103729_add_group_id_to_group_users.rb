class AddGroupIdToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :group_users, :Group_id, :integer
  end
end
