class AddHpToHand < ActiveRecord::Migration[7.0]
  def change
    add_column :hands, :hp, :integer
  end
end
