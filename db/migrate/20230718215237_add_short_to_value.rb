class AddShortToValue < ActiveRecord::Migration[7.0]
  def change
    add_column :values, :short, :string
  end
end
