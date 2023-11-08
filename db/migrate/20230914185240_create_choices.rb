class CreateChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :choices do |t|
      t.boolean :correct
      t.references :situation, null: false, foreign_key: true
      t.references :statement, null: false, foreign_key: true

      t.timestamps
    end
  end
end
