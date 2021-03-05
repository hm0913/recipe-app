class CreateIngredients < ActiveRecord::Migration[5.2]
  def change
    create_table :ingredients do |t|
      t.string :name, null: false
      t.string :amount, null: false
      t.integer :serving, null: false
      t.bigint :recipe_id

      t.timestamps
    end
  end
end
