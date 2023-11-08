class AddSummaryToSituation < ActiveRecord::Migration[7.0]
  def change
    add_column :situations, :summary, :text
  end
end
