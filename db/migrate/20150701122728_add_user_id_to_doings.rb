class AddUserIdToDoings < ActiveRecord::Migration
  def change
    add_column :doings, :user_id, :integer
  end
end
