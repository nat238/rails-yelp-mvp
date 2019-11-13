class Restaurant < ApplicationRecord
  validates :name, uniqueness: true, presence: true
  validates :address, presence: true
  validates :category, inclusion: { in: ["chinese", "italian", "japanese", "french", "belgian"] }

  has_many :reviews, dependent: :destroy

  def average_rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating.to_i
    end
    @rating = ratings.inject { |sum, el| sum + el }.to_f / ratings.size
    @rating.round(1)
  end
end
