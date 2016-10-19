class CreateGroceries < ActiveRecord::Migration
  def change
    create_table :groceries do |t|
      t.belongs_to :foodcategory, null: false
      t.string :name, null: false
      t.integer :quantity
      t.string :exp_date, null: false

      t.timestamps
    end
  end
end
