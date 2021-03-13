class CreateArtists < ActiveRecord::Migration[6.0]
    def change
      create_table :artists do |t|
        t.text :name
        t.text :genre
        t.integer :times_seen
        t.boolean :met
        t.belongs_to :user, foreign_key: :true

        t.timestamps
      end
    end
  end