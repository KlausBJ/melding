class CreateJoinTableBidSituation < ActiveRecord::Migration[7.0]
  def change
    create_join_table :bids, :situations do |t|
      # t.index [:bid_id, :situation_id]
      # t.index [:situation_id, :bid_id]
    end
  end
end
