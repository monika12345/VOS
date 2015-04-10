class StaticPagesController < ApplicationController
  def login
    @parking_place = current_user.parking_places.build if logged_in?
  end

  def registration
  end
end
