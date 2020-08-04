class ArtistVenue < ApplicationRecord
    belongs_to :artist, dependent: :destroy 
    belongs_to :venue, dependent: :destroy 
  end