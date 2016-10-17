class AddUserFridgeId < ActiveRecord::Migration
  def up
    add_column :users, :fridge_id, :integer
    change_column_null :users, :fridge_id, :false
    change_column_null :fridges, :user_id, :false
  end

  def down
    remove_column :users, :fridge_id, :integer
    change_column_null :fridges, :user_id, :true
  end
end
