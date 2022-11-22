class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :flat
  has_one :rating, dependent: :destroy
end
