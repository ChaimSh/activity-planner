class LocationsController < ApplicationController

  def index
    @locations = current_user.locations
  end

  def show
    @location = Location.find_by(id: params[:id])
  end

  def new
    @location = Location.new
  end
  
  def create
    @location = current_user.locations.build(location_params)
    if @location.save
        redirect_to location_path(@location)
    else
        render :new
    end
  end

  def edit
    @location = Location.find_by(id: params[:id])
  end

  def update
    @location = Location.find_by(id: params[:id])
    if @location.update(location_params)
        redirect_to location_path(@location)
    else
        render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address)
  end

end
