class LocationsController < ApplicationController
  def new
    @locat= Location.new
  end
  
  def create
    @locat = Location.new(location_params)


    if @locat.save
      flash[:success] = "lokalita vytvorena"
      redirect_to parking_places_path


      end
  end
  
  def destroy
  end
  
  def index
  @locations = Location.all
  end
  
  def show
     @location = Location.find(params[:id])
  end


  def location_params
    params.require(:location).permit(:city, :created_at)
    end
end
