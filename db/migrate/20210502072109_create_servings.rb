class CreateServings < ActiveRecord::Migration[5.2]
  def change
    create_table :servings do |t|
      t.integer :number, null: false

      t.timestamps
    end
  end
end
