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
end
