class Artist < ApplicationRecord
  validates :name, uniqueness: true, presence: true 
  belongs_to :user, optional: true
  has_many :artist_venues, dependent: :destroy 
  has_many :venues, through: :artist_venues, dependent: :destroy 
  accepts_nested_attributes_for :venues
  
  scope :order_artists, -> { order(name: :asc) }
  scope :artists_met, -> { where(met: true) }

end
