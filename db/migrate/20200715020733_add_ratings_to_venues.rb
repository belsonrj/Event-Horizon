class AddRatingsToVenues < ActiveRecord::Migration[6.0]
  def change
    add_column :venues, :layout, :integer
    add_column :venues, :sound, :integer
    add_column :venues, :comfort, :integer
    add_column :venues, :prices, :integer
  end
end
