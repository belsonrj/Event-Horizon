class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.text :name 
      t.text :locale
      t.text :venue_type
      t.text :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
