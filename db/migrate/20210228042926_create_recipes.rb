class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null: false
      t.string :category, null: false
      t.string :image, null: false
      t.text :introduction

      t.timestamps
    end
  end
end
