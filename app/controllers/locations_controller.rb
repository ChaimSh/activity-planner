class LocationsController < ApplicationController

  def index
    @locations = current_user.locations
    respond_to do |f|
      f.html {render :index}
      f.json {render json: @locations}
    end
  end

  def show
    @location = Location.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :show}
      f.json {render json: @location}
    end
  end

  def new
    @location = Location.new
    # render :new, layout: false
  end
  
  def create
    @location = current_user.locations.build(location_params)
    if @location.save
      # render json: @location
      respond_to do |f| 
        f.html {redirect_to locations_path} 
        f.json {render json: @location}
      end
    else
        render :new
    end
  end

  def edit
    @location = Location.find_by(id: params[:id])
    respond_to do |f|
      f.html {render :edit}
      f.json {render json: @location}
    end
  end

  def update
    @location = Location.find_by(id: params[:id])
    if @location.update(location_params)
      respond_to do |format| 
      format.html {redirect_to location_path(@location)}
      format.json { render json: @location}
      end
    else
        render :edit
    end
  end

  private

  def location_params
    params.require(:location).permit(:name, :address)
  end

end
