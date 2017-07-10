class AddGroupIdToMembers < ActiveRecord::Migration[5.0]
  def changes
    add_column :members, :group_id, :integer
  end
end
