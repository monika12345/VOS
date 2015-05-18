class Location < ActiveRecord::Base
has_many :parking_places    
      
    validates :city, presence: true

          
end
