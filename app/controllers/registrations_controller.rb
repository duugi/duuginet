# app/controllers/registrations_controller.rb
class RegistrationsController < Devise::RegistrationsController
  def new
    super
  end

  def edit
    # add custom create logic here
    respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    super
  end
end
