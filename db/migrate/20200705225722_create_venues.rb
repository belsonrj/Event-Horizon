class CreateVenues < ActiveRecord::Migration[6.0]
  def change
    create_table :venues do |t|
      t.string :name 
      t.string :locale
      t.string :venue_type
      t.string :content
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
