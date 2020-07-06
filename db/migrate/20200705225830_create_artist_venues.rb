class ArtistVenues < ActiveRecord::Migration
    def change
      create_table :artist_venues do |t|
        t.integer :artist_id
        t.integer :venue_id
        t.integer :user_id

        t.timestamps
      end
    end
  end