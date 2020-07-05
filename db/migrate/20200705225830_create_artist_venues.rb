class ArtistVenue < ActiveRecord::Migration
    def change
      create_table :artist_venue do |t|
        t.integer :artist_id
        t.integer :venue_id
        t.integer :user_id
      end
    end
  end