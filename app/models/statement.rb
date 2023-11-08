class Statement < ApplicationRecord
  has_many :choices
  has_many :situations, through: :choices
  
end
