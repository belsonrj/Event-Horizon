class Venue < ApplicationRecord
  belongs_to :user, optional: true
  has_many :artist_venues, dependent: :destroy 
  has_many :artists, through: :artist_venues, dependent: :destroy 
  
end
