class ReservationsController < ApplicationController
  def new
    @reservation = Reservation.new
  end

  def create
    @reservation = current_user.reservations.build(reservations_params)

    #@idcko= current_user.id
    # query = "INSERT INTO parking_places (user_id, spz, ulica, location_id, created_at, updated_at) VALUES ( #{@idcko} ,  '#{params[:parking_place][:spz]}' , '#{params[:parking_place][:ulica]}' , #{params[:parking_place][:location_id]}, (now()), (now()))"
    # @parking_place = current_user.parking_places.build(parking_places_params)
    #connection = ActiveRecord::Base.connection
    # @parking_place = connection.execute(query)

    if @reservation.save
      flash[:success] = "Parkovacie miesto prenajate"
      redirect_to parking_places_path
    else
      render 'static_pages/login'
    end
  end

  def reservations_params

    params.require(:reservation).permit(:rental_id, :duration, :price, :from,:to)
  end

  end

