class RenameAddressToDescription < ActiveRecord::Migration[5.0]
  def change
  	rename_column :locations, :address, :description
  end
end
