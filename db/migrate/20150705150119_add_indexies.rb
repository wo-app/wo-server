class AddIndexies < ActiveRecord::Migration
  def change
    add_index :doings, :user_id
    add_index :organizations, :token
    add_index :users, :organization_id
  end
end
