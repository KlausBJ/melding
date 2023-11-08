class CreateStatements < ActiveRecord::Migration[7.0]
  def change
    create_table :statements do |t|
      t.string :convention
      t.text :content

      t.timestamps
    end
  end
end
