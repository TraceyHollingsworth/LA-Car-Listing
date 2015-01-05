class Car < ActiveRecord::Base
  belongs_to :manufacturer

  validates :color, presence: true
  validates :year, presence: true
  validates :mileage, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :year, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1920 }
  validates_numericality_of :manufacturer_id
end
