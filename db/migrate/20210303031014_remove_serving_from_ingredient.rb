class RemoveServingFromIngredient < ActiveRecord::Migration[5.2]
  def change
    remove_column :ingredients, :serving, :integer
  end
end
