class User < ApplicationRecord
  has_secure_password
  validates_presence_of :username
  has_many :artists
  has_many :venues
  has_many :artist_venues
end
