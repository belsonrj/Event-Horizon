class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  has_many :artists
  has_many :venues
  #has_many :artist_venues
  has_many :collected_artists, through: :artist_venues, source: :artist
  has_many :collected_venues, through: :artist_venues, source: :venue
end
