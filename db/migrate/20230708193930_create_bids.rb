class CreateBids < ActiveRecord::Migration[7.0]
  def change
    create_table :bids do |t|
      t.integer :number
      t.references :suit, null: false, foreign_key: true

      t.timestamps
    end
  end
end
