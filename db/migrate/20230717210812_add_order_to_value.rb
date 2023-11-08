class AddOrderToValue < ActiveRecord::Migration[7.0]
  def change
    add_column :values, :order, :integer
  end
end
