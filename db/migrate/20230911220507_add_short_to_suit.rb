class AddShortToSuit < ActiveRecord::Migration[7.0]
  def change
    add_column :suits, :short, :string
  end
end
