class CreateParkingPlaces < ActiveRecord::Migration
  def change
    create_table :parking_places do |t|
      t.text :spz
      t.text :ulica
      t.references :user, index: true
      t.references :location, index: true
           
      t.timestamps null: false
      
    end
     add_foreign_key :parking_places, :users
      add_foreign_key :parking_places, :locations
     add_index :parking_places, [:user_id, :created_at]
   # add_index :parking_places, [:location_id, :created_at]
    
           
  end
end
