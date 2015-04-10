class Location < ActiveRecord::Base
has_many :parking_places    
      
    validates :city, presence: true
    validates :street, presence: true
    validates :parth, presence: true
          
end
