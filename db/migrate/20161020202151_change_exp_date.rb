class ChangeExpDate < ActiveRecord::Migration
  def up
    change_column_null :groceries, :exp_date, true
  end

  def down
    change_column_null :groceries, :exp_date, false
  end
end
