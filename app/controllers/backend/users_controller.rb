module Backend
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

  	

    def update
      respond_to do |format|
        if @user.update_attributes(user_params)
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
    #
    # def edit_extra
    #
    #   @user = current_user
    #
    #   respond_to do |format|
    #     format.html
    #     format.js
    #   end
    # end
    #
    # def post_extra
    #
    #   @user = current_user
    #
    #   #@user = User.find(params[:user_id])
    #
    #   @user.language = params[:language].to_s
    #   @user.time_zone = params[:time_zone].to_s
    #   @user.date_format = params[:date_format].to_s
    #   #@user.remember_country_selection = params[:mobile_number].to_s
    #
    #    #store to database!
    #
    #   respond_to do |format|
    #     if @user.save # @profile.update(backend_profile_params) redirect_to backend_profile_path,
    #       format.html { redirect_to backend_profile_path, notice: 'User was successfully updated.' }
    #       format.json { render :show, status: :ok }
    #       format.js
    #     else
    #       format.html { render :edit }
    #       format.json { render json: @user.errors, status: :unprocessable_entity }
    #       format.js
    #     end
    #   end
    # end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_user
        @backend_user = User.find(params[:id])
      end

      # Never trust parameters from the scary internet, only allow the white list through.
      def user_params
        params.require(:user).permit(:email, :admin, :date_format, :time_zone, :language)
      end
  end
end
