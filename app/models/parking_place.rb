class ParkingPlace < ActiveRecord::Base
  
  belongs_to :user
  belongs_to :location 
 
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
 
  validates :spz, presence: true



  def self.search(search)
    if search
      find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    else
      ParkingPlace.all
    end
  end


end
