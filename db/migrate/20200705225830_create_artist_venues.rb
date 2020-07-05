class ArtistVenues < ActiveRecord::Migration
    def change
      create_table :artist_venues do |t|
        t.integer :artist_id
        t.integer :venue_id
        t.integer :user_id
        t.belongs_to :user, foreign_key: true

        t.timestamps
      end
    end
  end