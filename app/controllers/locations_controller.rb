class LocationsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_resource, only: [:edit, :update, :destroy]

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
        format.json  { render :json => @location,
                      :status => :created, :location => @location }
      else
        format.html  { render :action => "new" }
        format.json  { render :json => @location.errors,
                      :status => :unprocessable_entity }
      end
    end
  end

  private
  def set_resource
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :name, :public, user_ids: [])
  end
end
