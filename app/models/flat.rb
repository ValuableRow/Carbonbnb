class Flat < ApplicationRecord
  belongs_to :user
  has_many :bookings
  validates :name, presence: true
  validates :description, presence: true
  validates :photos, presence: true
  validates :location, presence: true
  validates :capacity, presence: true
  validates :price_per_night, presence: true
end
