class CreateFridgecategories < ActiveRecord::Migration
  def change
    create_table :fridgecategories do |t|
      t.string :name, null: false
      t.belongs_to :fridge, null: false
    end
  end
end
