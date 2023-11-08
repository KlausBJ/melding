class CreateValues < ActiveRecord::Migration[7.0]
  def change
    create_table :values do |t|
      t.string :name
      t.integer :hp

      t.timestamps
    end
  end
end
