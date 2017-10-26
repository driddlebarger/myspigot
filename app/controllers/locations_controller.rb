class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.all
    @geojson = []

#Loop to pull location data and put into @geojson array of hashes
    @locations.each do |loc|
      @geojson << {
        :type => 'Feature',
        :geometry => {
          :type => 'Point',
          :coordinates => [loc.longitude, loc.latitude]
        },
        :properties => {
          :name => loc.name,
        }
      }
     end

#Add outer part of geojson format, put @geojson in as a hash value
    @geojson_output = {
      :type => "FeatureCollection",
      :features => @geojson
    }

     respond_to do |format|
       format.html
       format.json { render json: JSON.pretty_generate(@geojson_output) }  # respond with the created JSON object
     end

end

  # GET /locations/1
  # GET /locations/1.json
  def show
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :address, :latitude, :longitude)
    end
end
