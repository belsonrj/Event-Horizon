class Artist < ApplicationRecord
  belongs_to :user
  has_many :artist_venues
  has_many :venues, through: :artist_venues
  has many :artists, through: :artist_venues
end
