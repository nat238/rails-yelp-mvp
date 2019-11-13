class Review < ApplicationRecord
  validates :content, presence: true
  validates :rating, numericality: { :only_integer => true }, inclusion: { in: [0, 1, 2, 3, 4, 5] }

  belongs_to :restaurant
end
