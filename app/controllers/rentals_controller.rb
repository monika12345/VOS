class RentalsController < ApplicationController
  def new
    @rental = Rental.new
  end



  def create
    @rental = current_user.rentals.build(rental_params)



    if @rental.save
      flash[:success] = "Parkovacie miesto prenajate"
      redirect_to parking_places_path
    else
      render 'static_pages/login'
    end
  end

  private

  def rental_params

    params.require(:rental).permit(:parking_place_id, :from,:to, :duration,  :price)
  end
end
