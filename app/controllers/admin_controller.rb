class AdminController < AuthController
  before_action :set_vars
#  helper_method :klass
  layout "admin"

  #private

  #  def klass
  #    @klass ||= controller_name.classify.constantize
  #  end

  private
	    def set_vars
	    	@admin_nav = nil
	    	@body_class = nil
	    end

      def set_locale
        if params[:locale]
          I18n.locale = params[:locale]
        #elsif current_user.settings[:language]
        #  I18n.locale = current_user.settings.language
        else
          I18n.locale = I18n.default_locale
        end
        #I18n.locale = params[:locale] || I18n.default_locale
      end

      def set_session_and_redirect
        session[:locale] = I18n.locale
        redirect_to :back
      end

      def set_preferred_locale
        if user_signed_in?
          current_user.preferred_locale = I18n.locale.to_s
          current_user.save if current_user.changed?
        end
      end
end
