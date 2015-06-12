class AddTotimeToParkingPlaces < ActiveRecord::Migration
  def change
    add_column :parking_places, :to, :datetime
  end
end
