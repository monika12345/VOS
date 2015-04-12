class ParkingPlacesController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy]  

  def new 
    @parking_place = ParkingPlace.new
  end

  def show
    @parking_place = ParkingPlace.find(params[:id])
    @user = User.find(@parking_place.user_id)
   
  end

 def search
   @parking_places = ParkingPlace.search params[:search]
 end

  def index

   # @pocet= ParkingPlace.fin_by_sql( "SELECT  Count(*) FROM parking_places p JOIN users u  ON u.id = p.user_id GROUP BY p.ulica LIMIT(1))")
   # connection = ActiveRecord::Base.connection
   # connection.execute(q).first
    # @parking_place = ParkingPlace.search(params[:search])
    #@parking_place = ParkingPlace.find_by(params[:spz])
    #redirect_to root_url
    @parking_places= ParkingPlace.all
    @parking_places = ParkingPlace.paginate(page: params[:page])
    @pocet = pocetuz
    @mestaa = mesta
  end
  
  def create
       # @parking_place = current_user.parking_places.build(parking_places_params)
      
       @idcko= current_user.id
        query = "INSERT INTO parking_places (user_id, spz, ulica, location_id, created_at, updated_at) VALUES ( #{@idcko} ,  '#{params[:parking_place][:spz]}' , '#{params[:parking_place][:ulica]}' , #{params[:parking_place][:location_id]}, (now()), (now()))"     
    # @parking_place = current_user.parking_places.build(parking_places_params)
     connection = ActiveRecord::Base.connection
        @parking_place = connection.execute(query)
      
      #if @parking_place.save
       #    flash[:success] = "Parkovacie miesto vytvorene"
          redirect_to root_url
     # else
     #     render 'static_pages/login'
      # end
   end


def destroy
end

 private

 def pocetuz
   query = "SELECT p.ulica , Count(*) as count FROM parking_places p JOIN users u  ON u.id = p.user_id GROUP BY p.ulica"
   connection = ActiveRecord::Base.connection
   connection.execute(query)
 end

 def mesta

     query = "SELECT  l.city, Count(*) as count FROM parking_places p JOIN locations l ON l.id = p.location_id GROUP BY l.city"
     connection = ActiveRecord::Base.connection
     connection.execute(query)

 end

 def parking_places_params

   params.require(:parking_place).permit(:spz, :ulica, :location_id)
 end
end 