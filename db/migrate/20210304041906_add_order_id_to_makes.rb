class AddOrderIdToMakes < ActiveRecord::Migration[5.2]
  def change
    add_column :makes, :order_id, :bigint
  end
end
