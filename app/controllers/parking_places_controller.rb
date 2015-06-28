class ParkingPlacesController < ApplicationController
 before_action :logged_in_user, only: [:create, :destroy]  
 attr_accessor :pp
  def new 
    @parking_place = ParkingPlace.new

  end

  def show

    @parking_place = ParkingPlace.find(params[:id])
    @user = User.find(@parking_place.user_id)
    @rental = current_user.rentals.build if logged_in?

  end

 #def search
  # @parking_places= ParkingPlace.where(spz: params[:q]).first
   #flash[:success] = "ParkingPlace found!"
 #end




  def index
    @par = ParkingPlace.find_by(params[:id])



    @rental_last  = Rental.find_by(params[:parking_place_id])

    @nove = []
     @hodina = 0.hour

    if(@rental != nil)
        @rezervacie  = @rental_last.reservations
        end







    @reservation = current_user.reservations.build if logged_in?
    @parking_plac = current_user.parking_places.build if logged_in?

   # @pocet= ParkingPlace.fin_by_sql( "SELECT  Count(*) FROM parking_places p JOIN users u  ON u.id = p.user_id GROUP BY p.ulica LIMIT(1))")
   # connection = ActiveRecord::Base.connection
   # connection.execute(q).first
    # @parking_place = ParkingPlace.search(params[:search])
    #@parking_place = ParkingPlace.find_by(params[:spz])
    #redirect_to root_url
   #if(params[:q] != nil)
       #   @pp= ParkingPlace.where(spz: params[:q]).first
        # @parking_places = @pp
    @parking_places= ParkingPlace.all
    if((params[:s] != "" ) && (params[:s] != nil))

      @rr= ParkingPlace.where(ulica: params[:s])
      @parking_places = @rr
      # @parking_places = ParkingPlace.paginate(page: params[:page])
    end

    # @pocet = pocetuz
    @towns = mesta
  end



  def create
        @parking_place = current_user.parking_places.build(parking_places_params)

        #@idcko= current_user.id
        # query = "INSERT INTO parking_places (user_id, spz, ulica, location_id, created_at, updated_at) VALUES ( #{@idcko} ,  '#{params[:parking_place][:spz]}' , '#{params[:parking_place][:ulica]}' , #{params[:parking_place][:location_id]}, (now()), (now()))"
        # @parking_place = current_user.parking_places.build(parking_places_params)
        #connection = ActiveRecord::Base.connection
        # @parking_place = connection.execute(query)
      
      if @parking_place.save
          flash[:success] = "Parkovacie miesto vytvorene"
          redirect_to @current_user
      else
          render 'static_pages/login'
       end
   end
def edit
  end


 def update

   #3.  query = "UPDATE users SET name = '#{params[:user][:name]}', email = '#{params[:user][:email]}', updated_at = now() WHERE id = #{@user.id}"
   #3. connection = ActiveRecord::Base.connection
   #3. connection.execute(query)
   @parking_place = ParkingPlace.find(params[:id])
   if @parking_place.update_attributes(parking_places_params)
     flash[:success] = "Parkovacie miesto aktualizovane"
     redirect_to parking_places_path
   else

     render 'edit'
   end
 end

def destroy

    #2. User.find_by_sql("DELETE FROM users WHERE  users.id = #{params[:id]}")
    ParkingPlace.find(params[:id]).destroy

    flash[:success] = "Parking place deleted"
    redirect_to parking_places_url

end

 private

 def pocetuz
   #query = "SELECT p.ulica , Count(*) as count FROM parking_places p JOIN users u  ON u.id = p.user_id GROUP BY p.ulica"
   connection = ActiveRecord::Base.connection
   connection.execute(query)
 end

 def mesta

    # query = "SELECT  l.city, Count(*) as count FROM parking_places p JOIN locations l ON l.id = p.location_id GROUP BY l.city"
     #connection = ActiveRecord::Base.connection
    # connection.execute(query)


    # @m =  Location.select("locations.city, count(*) AS count").joins("LEFT JOIN parking_places ON parking_places.location_id = locations.id").group("locations.id")
 end

 def parking_places_params

   params.require(:parking_place).permit(:spz, :ulica, :location_id, :from,:to)
 end

end