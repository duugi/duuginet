class Backend::GroupsController < Backend::PreferenceController
  before_action :set_backend_group, only: [:show, :edit, :update, :destroy]

  

  # GET /backend/groups
  # GET /backend/groups.json
  def index
    @backend_groups = Backend::Group.all
  end

  # GET /backend/groups/1
  # GET /backend/groups/1.json
  def show
  end

  # GET /backend/groups/new
  def new
    @backend_group = Backend::Group.new

    respond_to do |format|
      format.html
      format.js
    end

  end

  # GET /backend/groups/1/edit
  def edit
    respond_to do |format|
      format.html
      format.js
    end
  end

  # POST /backend/groups
  # POST /backend/groups.json
  def create

    @backend_group = Backend::Group.new(backend_group_params)

    #respond_modal_with @backend_group, location: backend_group_path

    respond_to do |format|
      if @backend_group.save
        format.html { redirect_to @backend_group, notice: 'Group was successfully created.' }
        format.json { render :show, status: :created, location: @backend_group }
      else
        format.html { render :new }
        format.json { render json: @backend_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /backend/groups/1
  # PATCH/PUT /backend/groups/1.json
  def update
    respond_to do |format|
      if @backend_group.update(backend_group_params)
        format.html { redirect_to @backend_group, notice: 'Group was successfully updated.' }
        format.json { render :show, status: :ok, location: @backend_group }
      else
        format.html { render :edit }
        format.json { render json: @backend_group.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /backend/groups/1
  # DELETE /backend/groups/1.json
  def destroy
    @backend_group.destroy
    respond_to do |format|
      format.html { redirect_to backend_groups_url, notice: 'Group was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_backend_group
      @backend_group = Backend::Group.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def backend_group_params
      params.require(:backend_group).permit(:name, :description, :is_active, :is_public)
    end
end
