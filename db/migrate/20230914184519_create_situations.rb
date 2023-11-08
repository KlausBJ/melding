class CreateSituations < ActiveRecord::Migration[7.0]
  def change
    create_table :situations do |t|
      t.references :hand, null: false, foreign_key: true

      t.timestamps
    end
  end
end
