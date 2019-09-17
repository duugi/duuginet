class PagesController < ApplicationController
  #caches_page :aboutus
  caches_action :archive, expires_in: 1.day
  caches_action :index #, unless: { request.format.json? }

  # GET /posts
  # GET /posts.json
  def index
  #  @user = current_user.email
  end

  def aboutus

  end
end
