class AddSubmittedByToLocations < ActiveRecord::Migration[5.0]
  def change
    add_column :locations, :submitted_by, :string
    Location.all.update_all submitted_by: "admin@waterspotterapp.com"
  end
end
