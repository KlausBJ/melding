class AddBalancedToHand < ActiveRecord::Migration[7.0]
  def change
    add_column :hands, :balanced, :boolean
  end
end
