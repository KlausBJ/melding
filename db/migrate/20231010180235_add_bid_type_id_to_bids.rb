class AddRealBidTypeIdToBids < ActiveRecord::Migration[7.0]
  def change
    add_column :bids, :bid_type_id, :integer
  end
end
