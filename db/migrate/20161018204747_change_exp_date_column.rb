class ChangeExpDateColumn < ActiveRecord::Migration
  def up
    remove_column :groceries, :exp_date
    add_column :groceries, :exp_date, :date
    change_column_null :groceries, :exp_date, false
  end

  def down
    remove_column :groceries, :exp_date
    add_column :groceries, :exp_date, :string
  end
end
