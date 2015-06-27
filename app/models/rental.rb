class Rental < ActiveRecord::Base
  belongs_to :parking_place
  has_many :reservations
end
