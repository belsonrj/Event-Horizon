class Venue < ApplicationRecord
  belongs_to :user, optional: true
  has_many :artist_venues
  has_many :artists, through: :artist_venues
  
end
