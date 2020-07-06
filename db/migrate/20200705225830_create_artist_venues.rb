class CreateArtistVenues < ActiveRecord::Migration[6.0]
    def change
      create_table :artist_venues do |t|
        t.integer :artist_id
        t.integer :venue_id
        t.integer :user_id

        t.timestamps
      end
    end
  end