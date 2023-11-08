class CreateHands < ActiveRecord::Migration[7.0]
  def change
    create_table :hands do |t|

      t.timestamps
    end
  end
end
