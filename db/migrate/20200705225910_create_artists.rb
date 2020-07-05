class CreateArtists < ActiveRecord::Migration[6.0]
    def change
      create_table :artists do |t|
        t.string :name
        t.string :genre
        t.integer :times_seen
        t.boolean :met
        t.timestamps
      end
    end
  end