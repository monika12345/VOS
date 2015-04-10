class ParkingPlace < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :location 
 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
 
  validates :spz, presence: true
end
