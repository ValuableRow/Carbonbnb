class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :ratings, through: :bookings

  include PgSearch::Model

  def average_rating
    unless ratings.empty?
      flat_ratings = ratings.map { |rating| rating.rating }
      flat_ratings.sum.to_f / flat_ratings.count
    end
  end

  pg_search_scope :global_search,
    against: [ :name, :location, :description ],
    using: {
      tsearch: { prefix: true }
    }
end
