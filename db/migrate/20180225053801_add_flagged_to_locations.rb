class AddFlaggedToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :flagged, :boolean, default: false
  end
end
