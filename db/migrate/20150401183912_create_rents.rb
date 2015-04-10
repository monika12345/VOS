class CreateRents < ActiveRecord::Migration
  def change
    create_table :rents do |t|
      t.string :name
      t.string :email

      t.timestamps null: false
    end
  end
end
