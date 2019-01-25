class LocationsController < ApplicationController
  before_action :authenticate_user!

  def new
    @location = Location.new
  end

  def create
    @location = Location.new(location_params)
    @location.creator = current_user
    respond_to do |format|
      if @location.save
        format.html  { redirect_to(user_path(current_user),
                      :notice => 'location was successfully created.') }
      else
        format.html  { render :action => "new" }
      end
    end
  end

  private
  def location_params
    params.require(:location).permit(:latitude, :longitude, :name, :public, user_ids: [])
  end
end
