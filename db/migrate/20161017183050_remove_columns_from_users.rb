class RemoveColumnsFromUsers < ActiveRecord::Migration
  def up
    remove_column :users, :fridge_id
  end

  def down
    add_column :users, :fridge_id, :integer
  end
end
