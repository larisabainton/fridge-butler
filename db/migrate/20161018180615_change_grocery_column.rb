class ChangeGroceryColumn < ActiveRecord::Migration
  def up
    remove_column :groceries, :foodcategory_id
    add_column :groceries, :fridgecategory_id, :integer
    change_column_null :groceries, :fridgecategory_id, false
  end

  def down
    remove_column :groceries, :fridgecategory_id
    add_column :groceries, :foodcategory_id, :integer
  end
end
