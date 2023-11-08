class CreateHandCards < ActiveRecord::Migration[7.0]
  def change
    create_table :hand_cards do |t|
      t.references :hand, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true

      t.timestamps
    end
  end
end
