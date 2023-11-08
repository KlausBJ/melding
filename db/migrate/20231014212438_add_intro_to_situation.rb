class AddIntroToSituation < ActiveRecord::Migration[7.0]
  def change
    add_column :situations, :intro, :text
  end
end
