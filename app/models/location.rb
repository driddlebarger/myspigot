class Location < ApplicationRecord

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |location|
        csv << location.attributes.values_at(*column_names)
      end
    end
  end


end
