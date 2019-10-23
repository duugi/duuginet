class Backend::LocationsController < Backend::PreferenceController
  before_action :set_backend_location, only: [:show, :edit, :update, :destroy]

  # GET /backend/locations
  # GET /backend/locations.json
  def index
    @backend_locations = Backend::Location.all
  end

  # GET /backend/locations/1
  # GET /backend/locations/1.json
  def show
  end

  # GET /backend/locations/new
  def new
    @backend_location = Backend::Location.new
  end

  # GET /backend/locations/1/edit
  def edit
  end

  # POST /backend/locations
  # POST /backend/locations.json
  def create
    @backend_location = Backend::Location.new(backend_location_params)

    respond_to do |format|
      if @backend_location.save
        format.html { redirect_to @backend_location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @backend_location }
      else
        format.html { render :new }
        format.json { render json: @backend_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/locations/1
  # PATCH/PUT /backend/locations/1.json
  def update
    respond_to do |format|
      if @backend_location.update(backend_location_params)
        format.html { redirect_to @backend_location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_location }
      else
        format.html { render :edit }
        format.json { render json: @backend_location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/locations/1
  # DELETE /backend/locations/1.json
  def destroy
    @backend_location.destroy
    respond_to do |format|
      format.html { redirect_to backend_locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_location
      @backend_location = Backend::Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_location_params
      params.require(:backend_location).permit(:name, :country_code, :description, :state_code, :timezone_code, :is_active)
    end
end
