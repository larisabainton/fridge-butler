class UpdateGroceries < ActiveRecord::Migration
  def up
    add_column :groceries, :grocerylist_id, :integer
  end

  def down
    remove_column :groceries, :grocerylist_id
  end
end
