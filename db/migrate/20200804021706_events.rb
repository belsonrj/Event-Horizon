class Events < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.text :city
      t.text :artist
      t.text :venue

      t.timestamps
    end
  end
end
