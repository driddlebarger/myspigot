class AddRestroomsToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :nearby_restroom, :boolean
  end
end
