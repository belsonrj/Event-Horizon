class Venue < ApplicationRecord
  validates :name, uniqueness: true, presence: true 
  belongs_to :user, optional: true
  has_many :artist_venues
  has_many :artists, through: :artist_venues, :dependent => :destroy

  scope :order_venues, -> { order(name: :asc) }
  
  scope :order_by_layout, -> { order(layout: :desc) }
  scope :order_by_sound, -> { order(sound: :desc) }
  scope :order_by_comfort, -> { order(comfort: :desc) }
  scope :order_by_prices, -> { order(price: :desc) }

end
