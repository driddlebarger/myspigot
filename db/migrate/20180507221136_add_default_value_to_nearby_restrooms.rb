class AddDefaultValueToNearbyRestrooms < ActiveRecord::Migration[5.0]
  def up
  	    Location.all.update_all nearby_restroom: false
  end
end
