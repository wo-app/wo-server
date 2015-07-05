class AddSomeColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :recent_repo, :string
    add_column :users, :recent_branch, :string
    add_column :users, :recent_did_at, :datetime
  end
end
