class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.belongs_to :user, null: false
      t.string :title, null: false
      t.text :ingredients, array: true, default: []
      t.string :f2f_url
      t.string :publisher
      t.string :source_url
      t.string :recipe_id
      t.string :social_rank
      t.string :image_url
    end
  end
end
