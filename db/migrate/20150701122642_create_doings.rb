class CreateDoings < ActiveRecord::Migration
  def change
    create_table :doings do |t|
      t.string :repo
      t.string :name

      t.timestamps null: false
    end
  end
end
