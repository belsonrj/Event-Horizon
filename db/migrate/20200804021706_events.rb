class Events < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string :name
      t.datetime :date
      t.string :city
      t.string :artist
      t.string :venue

      t.timestamps
    end
  end
end
