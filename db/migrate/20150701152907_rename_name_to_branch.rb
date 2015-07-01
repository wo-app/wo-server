class RenameNameToBranch < ActiveRecord::Migration
  def change
    rename_column :doings, :name, :branch
  end
end
