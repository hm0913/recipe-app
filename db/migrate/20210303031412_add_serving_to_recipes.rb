class AddServingToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :serving, :integer, null: false
  end
end
