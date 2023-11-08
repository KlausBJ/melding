class Card < ApplicationRecord
  belongs_to :suit
  belongs_to :value
  has_many :hand_cards
  has_many :hands, through: :hand_cards
  
  def name
    return suit.name + ' ' + value.name
  end
  
  def hp
    return value.hp
  end
  
  def short
    return value.short + '_' + suit.short
  end
  
  def previous
    Card.limit(1).order("id DESC").where("id < ?", id).first
  end

  def next
    Card.limit(1).order("id").where("id > ?", id).first
  end

end
