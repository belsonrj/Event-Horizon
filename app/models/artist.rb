class Artist < ApplicationRecord
  belongs_to :user, optional: true
  has_many :artist_venues
  has_many :venues, through: :artist_venues
  accepts_nested_attributes_for :venues
end
