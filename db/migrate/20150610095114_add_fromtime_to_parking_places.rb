class AddFromtimeToParkingPlaces < ActiveRecord::Migration
  def change
    add_column :parking_places, :from, :datetime
  end
end
