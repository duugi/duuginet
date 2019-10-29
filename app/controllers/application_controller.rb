class ApplicationController < ActionController::Base
  include PageLayoutHelper

  before_action :set_locale
  before_action :set_saas_db

  rescue_from CanCan::AccessDenied do |exception|
	  redirect_to root_url, :alert => exception.message
	end

  def jump_to_home()
		unless !current_user.role.default_page?
      redirect_to eval current_user.role.default_page
	 	else
			current_user
	 	end
	end

  private
    def set_locale
      if user_signed_in?
        I18n.locale = current_user.language || I18n.default_locale
      end
    end

    def set_saas_db
      available_domains = [:duuginet, :duugi, :aqua, :cityoptic]
      default_domain = "www"

      detected_subdomain = request.subdomains.first
      puts detected_subdomain
      domain = available_domains.map(&:to_s).include?(detected_subdomain) ? detected_subdomain : default_domain



      puts domain
    end
end
