class Course < ApplicationRecord
has_many :lessons
has_many :situations, through: :lessons
belongs_to :standard

end
