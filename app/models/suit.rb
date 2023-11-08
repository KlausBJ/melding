class Suit < ApplicationRecord
  has_many :cards
  has_many :bids
  
end
