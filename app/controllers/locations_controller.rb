class LocationsController < ApplicationController
  def new
  end
  
  def create
  end
  
  def destroy
  end
  
  def index
  @locations = Location.all
  end
  
  def show
     @location = Location.find(params[:id])
  end
end
