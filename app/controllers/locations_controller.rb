class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy, :verify, :flag]
  before_action :authenticate_admin_user!, except: [:index, :show, :verify, :flag, :create, :new] #added create method
  

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
          :description => loc.description,
          :id => loc.id
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
  def show
    mixpanel.track("View Location", "Location ID"          => @location.id,
                                    "Location Name"        => @location.name)
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to @location, notice: 'Location was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /locations/1
  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /locations/1
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
    end
  end

  def verify
    @location.liked_by current_user
    mixpanel.track("Verify Location", "Location ID"          => @location.id,
                                      "Location Name"        => @location.name,
                                      "User ID"              => current_user.id,
                                      "User Email"           => current_user.email)
    flash[:notice] = "Thanks for verifying!"
    if @location.get_upvotes.size == 1
      VerifyMailer.first_verify(@location).deliver_now
    end

    redirect_back(fallback_location: root_path)
  end

  #Location flagging
  def flag
    @location.update_attribute(:flagged, 'True')
    #send email saying that it is flagged
    FlagLocationMailer.flag_location(current_user, @location).deliver_now
    flash[:notice] = "You have flagged this location."
    redirect_back(fallback_location: root_path)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:name, :description, :latitude, :longitude, :submitted_by)
    end
end
