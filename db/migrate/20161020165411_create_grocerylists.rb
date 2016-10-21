class CreateGrocerylists < ActiveRecord::Migration
  def change
    create_table :grocerylists do |t|
      t.belongs_to :user, null: false
      t.string :name, null: false
    end
  end
end
