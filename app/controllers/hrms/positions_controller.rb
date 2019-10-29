class Hrms::PositionsController < AdminController
  before_action :set_hrms_position, only: [:show, :edit, :update, :destroy]

  layout "hrms"

  # GET /hrms/positions
  # GET /hrms/positions.json
  def index
    @hrms_positions = Hrms::Position.all
  end

  # GET /hrms/positions/1
  # GET /hrms/positions/1.json
  def show
  end

  # GET /hrms/positions/new
  def new
    @hrms_position = Hrms::Position.new
  end

  # GET /hrms/positions/1/edit
  def edit
  end

  # POST /hrms/positions
  # POST /hrms/positions.json
  def create
    @hrms_position = Hrms::Position.new(hrms_position_params)

    respond_to do |format|
      if @hrms_position.save
        format.html { redirect_to @hrms_position, notice: 'Position was successfully created.' }
        format.json { render :show, status: :created, location: @hrms_position }
      else
        format.html { render :new }
        format.json { render json: @hrms_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hrms/positions/1
  # PATCH/PUT /hrms/positions/1.json
  def update
    respond_to do |format|
      if @hrms_position.update(hrms_position_params)
        format.html { redirect_to @hrms_position, notice: 'Position was successfully updated.' }
        format.json { render :show, status: :ok, location: @hrms_position }
      else
        format.html { render :edit }
        format.json { render json: @hrms_position.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrms/positions/1
  # DELETE /hrms/positions/1.json
  def destroy
    @hrms_position.destroy
    respond_to do |format|
      format.html { redirect_to hrms_positions_url, notice: 'Position was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hrms_position
      @hrms_position = Hrms::Position.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hrms_position_params
      params.require(:hrms_position).permit(:name, :description, :department_id)
    end
end
