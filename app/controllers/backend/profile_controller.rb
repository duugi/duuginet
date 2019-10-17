module Backend
	class ProfileController < AdminController
		before_action :set_vars
		before_action :set_profile, only: [:edit_general, :post_general, :update, :upload_avatar, :post_update_avatar]

		layout "profile"

		def index
			@id = current_user.id
  	end

		def show
			if params[:id] == "create_profile"
				puts "Create Profile"
				current_user.create_profile!
			end
		end

		def upload_avatar
			@profile = Profile.find(current_user.profile.id)

			respond_to do |format|
	      format.html
	      format.js
	    end
		end

		def post_update_avatar
	    respond_to do |format|
	      if @profile.update(backend_profile_params)
	        format.html { redirect_to "/backend/profile", notice: 'Group was successfully updated.' }
	        format.json { render :show, status: :ok, location: @profile }
					format.js
	      else
	        format.html { render :edit }
	        format.json { render json: @profile.errors, status: :unprocessable_entity }
					format.js
	      end
	    end
	  end

		def edit_general
			@profile = Profile.find(current_user.profile.id)

			respond_to do |format|
	      format.html
	      format.js
	    end
		end

		def post_general

	    @profile.firstname = params[:firstname].to_s
			@profile.lastname = params[:lastname].to_s
			@profile.phone_number = params[:phone_number].to_s
			@profile.mobile_number = params[:mobile_number].to_s

			respond_to do |format|
				if @profile.save # @profile.update(backend_profile_params) redirect_to backend_profile_path,
					format.html { redirect_to backend_profile_path, notice: 'Profile was successfully updated.' }
					format.json { render :show, status: :ok }
					format.js
				else
					format.html { render :edit }
					format.json { render json: @profile.errors, status: :unprocessable_entity }
					format.js
				end
			end
		end

  	private
			def set_profile
	      @profile = Profile.find(current_user.profile.id)
	    end

	    def set_vars
	    end

			def backend_profile_params
	      params.require(:profile).permit(:firstname, :lastname, :phone_number, :avatar)
	    end
	end
end
