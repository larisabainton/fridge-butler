class CreateFridge < ActiveRecord::Migration
  def change
    create_table :fridges do |t|
      t.string :name, null: false, default: "Fridge"
      t.belongs_to :user

      t.timestamps
    end
  end
end
