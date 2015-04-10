class AddIdlocToParkingPlaces < ActiveRecord::Migration
  def change
    add_column :parking_places, :location_id, :integer
  end
end
