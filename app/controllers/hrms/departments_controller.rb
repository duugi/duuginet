class Hrms::DepartmentsController < Backend::PreferenceController
  before_action :set_hrms_department, only: [:show, :edit, :update, :destroy]

  # GET /hrms/departments
  # GET /hrms/departments.json
  def index
    @hrms_departments = Hrms::Department.all
  end

  # GET /hrms/departments/1
  # GET /hrms/departments/1.json
  def show
  end

  # GET /hrms/departments/new
  def new
    @hrms_department = Hrms::Department.new
  end

  # GET /hrms/departments/1/edit
  def edit
  end

  # POST /hrms/departments
  # POST /hrms/departments.json
  def create
    @hrms_department = Hrms::Department.new(hrms_department_params)

    respond_to do |format|
      if @hrms_department.save
        format.html { redirect_to @hrms_department, notice: 'Department was successfully created.' }
        format.json { render :show, status: :created, location: @hrms_department }
      else
        format.html { render :new }
        format.json { render json: @hrms_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /hrms/departments/1
  # PATCH/PUT /hrms/departments/1.json
  def update
    respond_to do |format|
      if @hrms_department.update(hrms_department_params)
        format.html { redirect_to @hrms_department, notice: 'Department was successfully updated.' }
        format.json { render :show, status: :ok, location: @hrms_department }
      else
        format.html { render :edit }
        format.json { render json: @hrms_department.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hrms/departments/1
  # DELETE /hrms/departments/1.json
  def destroy
    @hrms_department.destroy
    respond_to do |format|
      format.html { redirect_to hrms_departments_url, notice: 'Department was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_hrms_department
      @hrms_department = Hrms::Department.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def hrms_department_params
      params.require(:hrms_department).permit(:name, :description, :leave_allow_count, :max_ppl_absent, :max_absent_length)
    end
end
