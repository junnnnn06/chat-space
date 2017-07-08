class CreateGroupUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :group_users do |t|
      t.references :user, null: false, foregn_key: true
      t.references :group, null: false, foregn_key: true
      t.timestamps
    end
  end
end
