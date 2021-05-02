class RemoveServingFromRecipes < ActiveRecord::Migration[5.2]
  def change
    remove_column :recipes, :serving, :integer
  end
end
