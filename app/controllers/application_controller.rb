class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  #Google+ login auth helper
  include AuthenticationHelper

  # filter for admins
  def grant_access
    unless admin?
      flash[:error] = "You are not authorized to do that!"
      redirect_to root_path
    end
  end

  def logged_in
  	unless current_user
			flash[:error] = "You have to be logged in to use that feature!"
			redirect_to root_path
		end
	end
end
