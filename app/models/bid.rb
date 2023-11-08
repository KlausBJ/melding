class Bid < ApplicationRecord
  belongs_to :suit
  belongs_to :bid_type
  has_and_belongs_to_many :situations
  
  def present
    return "Slut" if bid_type.name == 'Slut'
    return bid_type.name + ': ' + number.to_s + ' ' + suit.name
  end
  
  def pres
    return 'Slut' if bid_type.name == 'Slut'
    return number.to_s + ' ' + suit.name
  end
end
