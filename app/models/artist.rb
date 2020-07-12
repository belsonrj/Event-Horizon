class Artist < ApplicationRecord
  belongs_to :user, optional: true
  has_many :artist_venues, dependent: :destroy 
  has_many :venues, through: :artist_venues, dependent: :destroy 
  accepts_nested_attributes_for :venues

  #def venues_attributes=(venues_hashes)
    
  #  venues_hashes.each do |i, venue_attributes|
  #    venue = Venue.find_or_create_by(name: venue_attributes[:name])
      
  #    self.artist_venues.build(:venue => venue)
      
  #  end
  #end
end
