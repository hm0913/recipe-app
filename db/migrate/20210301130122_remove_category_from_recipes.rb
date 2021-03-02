class RemoveCategoryFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :category, :string
  end
end
