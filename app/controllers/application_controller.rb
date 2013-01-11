class ApplicationController < ActionController::Base
  protect_from_forgery
  
  helper_method :current_user
  helper_method :auth

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def auth_required
    unless current_user && User.all().count() > 0
      redirect_to login_url
    end
  end
  
end
