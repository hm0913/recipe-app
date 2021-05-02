class AddServingIdToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column :recipes, :serving_id, :string, null: false
  end
end
