class ParkingPlacesController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy]  

  def new 
    @parking_place = ParkingPlace.new
  end

  def show
    @parking_place = ParkingPlace.find(params[:id])
    @user = User.find(@parking_place.user_id)
   
  end
  
  def index
    @parking_places= ParkingPlace.all
    @parking_places = ParkingPlace.paginate(page: params[:page])
  end
  
  def create
      @parking_place = current_user.parking_places.build(parking_places_params)
      if @parking_place.save
            flash[:success] = "Parkovacie miesto vytvorene"
            redirect_to root_url
       else
          render 'static_pages/login'
       end
   end


def destroy
end

 private
 
 def parking_places_params

   params.require(:parking_place).permit(:spz, :ulica, :location_id)
 end
end 