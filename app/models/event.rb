class Event < ApplicationRecord
    validates :name, presence: true 
    validates :date, presence: true
    has_many :comments
    has_many :users, through: :comments

end