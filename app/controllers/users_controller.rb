class UsersController < Backend::PreferenceController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :save]

  def index
    @users = User.all
	end

  def show
    require 'rqrcode'
    qrcode = RQRCode::QRCode.new("http://github.com/")

    @qr = RQRCode::QRCode.new( 'https://github.com/whomwah/rqrcode', :size => 4, :level => :h )

    @subtab = params['subtab'] ? params['subtab'] : "overview"
	end

	def edit
		@roles = {}
		#Role.find(:all).collect {|r| @roles[r.name] = r.role_id }
	end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def save
    #params["admin"]
    #@user.update_attributes(:admin => true)
    @var1 = false
    puts params[:admin]
    puts @var1
    if params[:admin] == 1 then
      @var1 = true
    end
    @user.update_attribute(:admin, @var1)
    respond_to do |format|
       format.json { render :json => {:status => :ok, :p1 => params[:admin]} }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:email, :admin)
    end
end
