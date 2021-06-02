class CreateBuyItems < ActiveRecord::Migration[5.2]
  def change
    create_table :buy_items do |t|
      t.bigint :recipe_id
      t.bigint :ingredient_id
      t.bigint :user_id

      t.timestamps
    end
  end
end
