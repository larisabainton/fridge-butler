class GrocerylistDefaultValue < ActiveRecord::Migration
  def up
    change_column_default(:grocerylists, :name, "Grocery List")
  end

  def down
    change_column_default(:grocerylists, :name, nil)
  end
end
