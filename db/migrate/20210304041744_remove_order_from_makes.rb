class RemoveOrderFromMakes < ActiveRecord::Migration[5.2]
  def change
    remove_column :makes, :order, :integer
  end
end
