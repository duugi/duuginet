class PagesController < ApplicationController
  #caches_page :aboutus
  caches_action :archive, expires_in: 1.day
  caches_action :index #, unless: { request.format.json? }

  # GET /posts
  # GET /posts.json
  def index
  #  @user = current_user.email
    if user_signed_in?
      jump_to_home()
    end
  end

  def route_not_found

  end

  def aboutus

  end
end
