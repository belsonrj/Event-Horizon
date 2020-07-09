class User < ApplicationRecord
  has_secure_password
  validates :username, uniqueness: true, presence: true 
  has_many :artists
  accepts_nested_attributes_for :artists
  has_many :venues
  accepts_nested_attributes_for :venues
  #has_many :artist_venues
  has_many :collected_artists, through: :artist_venues, source: :artist
  has_many :collected_venues, through: :artist_venues, source: :venue
end
