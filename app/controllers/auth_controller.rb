class AuthController < ApplicationController
	before_action :authenticate_user!
	#before_action :init_user

	#before_action :set_locale

	private
		# def init_user
		# 	unless current_user.profile
		# 		current_user.create_profile!
		# 	end
		# end

	#def set_locale
	#  	I18n.locale = current_user.language || I18n.default_locale
	#end
end
