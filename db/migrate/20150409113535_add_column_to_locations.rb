class AddColumnToLocations < ActiveRecord::Migration
  def change
    add_column :locations, :city, :string
    add_column :locations, :street, :string
    add_column :locations, :parth, :string
  end
end
