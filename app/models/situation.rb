class Situation < ApplicationRecord
  has_many :lessons
  has_many :courses, through: :lessons
  belongs_to :hand
  has_and_belongs_to_many :bids
  has_many :choices
  has_many :statements, through: :choices
  
    def previous
    Situation.limit(1).order("id DESC").where("id < ?", id).first
  end

  def next
    Situation.limit(1).order("id").where("id > ?", id).first
  end
  
end
