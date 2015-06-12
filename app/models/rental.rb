class Rental < ActiveRecord::Base
  belongs_to :parking_place
  belongs_to :user
end
