class CreateMakes < ActiveRecord::Migration[5.2]
  def change
    create_table :makes do |t|
      t.integer :order, null: false
      t.text :sentence, null: false
      t.bigint :recipe_id

      t.timestamps
    end
  end
end
