class Hand < ApplicationRecord
  has_many :situations
  has_many :hand_cards
  has_many :cards, through: :hand_cards
  
  def self.create_from_notation (notation)
    h = Hand.create
    
    sorted = notation.split('.')
    
    kl = Suit.find_by_name('Klør')
    ru = Suit.find_by_name('Ruder')
    hj = Suit.find_by_name('Hjerter')
    sp = Suit.find_by_name('Spar')
    
    sorted[0].split('').each do |s|
      v = Value.find_by(short: s)
      c = Card.find_by(value: v, suit: sp)
      HandCard.create(hand: h, card: c)
    end
    
    sorted[1].split('').each do |s|
      v = Value.find_by(short: s)
      c = Card.find_by(value: v, suit: hj)
      HandCard.create(hand: h, card: c)
    end
    
    sorted[2].split('').each do |s|
      v = Value.find_by(short: s)
      c = Card.find_by(value: v, suit: ru)
      HandCard.create(hand: h, card: c)
    end
    
    if sorted[3]
      sorted[3].split('').each do |s|
        v = Value.find_by(short: s)
        c = Card.find_by(value: v, suit: kl)
        HandCard.create(hand: h, card: c)
      end
    end
    
    h.balanced = h.balanced_calc
    h.hp = h.hp_calc
    h.save
  end
  
  def distribution
    kl = Suit.find_by_name('Klør')
    ru = Suit.find_by_name('Ruder')
    hj = Suit.find_by_name('Hjerter')
    sp = Suit.find_by_name('Spar')
    
    klc = cards.where(suit: kl).count
    ruc = cards.where(suit: ru).count
    hjc = cards.where(suit: hj).count
    spc = cards.where(suit: sp).count
    
    return [klc,ruc,hjc,spc].sort.reverse
  end
  
  def balanced_calc
    return true if self.distribution == [4,4,3,2] || self.distribution == [4,3,3,3] || self.distribution == [5,3,3,2]
    return false
  end
  
  def list
    return cards.order(:id).map { |c| c.name }
  end
  
  def hp_calc
    return cards.map { |c| c.hp }.sum
  end
  
  def htype
    return self.balanced ? 'Jævn hånd' : 'Skæv hånd'
  end
  
  def summary
    return self.list.join("\r\n") + "\r\n\r\nFordeling: #{self.distribution}\r\n#{self.htype}, HP: #{self.hp}"
  end
  
  def previous
    Hand.limit(1).order("id DESC").where("id < ?", id).first
  end

  def next
    Hand.limit(1).order("id").where("id > ?", id).first
  end

end
