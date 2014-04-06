class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_con

  #Google+ login auth helper
  include AuthenticationHelper

  # filter for admins
  def grant_access
    unless admin?
      flash[:error] = "You are not authorized to do that!"
      redirect_to '/'
      #redirect_to  :back
    end
  end

  #Method to check if the user has access to the requested url
  def access_url
   a = current_user.id.to_s.length
   b = request.original_url.to_s.length
   id = request.original_url.to_s[b-a..b]
    if (id != current_user.id.to_s)
      if (current_user.role != 'admin')
        flash[:error] = "You are not authorized to do that!"
        #attempted redirect to: back and got - No HTTP_REFERER was set in the request to this action, so redirect_to :back could not be called successfully
        #redirect_to :back
        redirect_to '/'
      end
    end
  end

  #Check if the user is the requested url to edit their info (admin always has permission to do this)
  # not leving it like this
  def edit_access

  # if !request.original_url.to_s.include? current_user.id.to_s
  #     flash[:error] = request.original_url.to_s[0..request.original_url.to_s.length-6 
  #     redirect_to '/'
  #     end

  a = current_user.id.to_s.length
  # subtract 5 for /edit
  b = request.original_url.to_s.length
  id = request.original_url.to_s[b-a-5..b-6]
  # if id is != the id in the url, check and see if they're admin; otherwise, grant them access
  if (id.to_s != current_user.id.to_s)
    if (current_user.role != 'admin')
      flash[:error] = "You are not authorized to do that!"
      redirect_to '/'
    end
  end

  end

  def current_con
    @current_con ||= Conference.find(session[:current_con]) if session[:current_con]
  end

  def logged_in
    unless current_user
      flash[:error] = "You have to be logged in to use that feature!"
      redirect_to root_path
    end
  end
end
