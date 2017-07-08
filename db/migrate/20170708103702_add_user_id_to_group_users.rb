class AddUserIdToGroupUsers < ActiveRecord::Migration[5.0]
  def change
    add_column :group_users, :User_id, :integer
    
  end
end
