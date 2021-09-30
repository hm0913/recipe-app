class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.bigint :user_id
      t.bigint :trouble_id
      t.text :text, null: false

      t.timestamps
    end
  end
end
