class ApplicationController < ActionController::Base
  
  helper_method :current_user, :logged_in?
  
  #returns nil if there is no session token set yet, or the current user
  def current_user
    return nil if session[:session_token].nil?
    @current_user ||= User.find_by_session_token(session[:session_token])
  end
  
  #logged in if there is a current user
  def logged_in?
    !current_user.nil?
  end
  
  #set the session[session_token] to the reset user's session token
  def log_in_user!(user)
    session[:session_token] = user.reset_session_token!
  end
  
  def log_out_user!
    #what is the reason for: current_user.reset_session_token! -> resets the session_token in the database
    session[:session_token] = nil
  end
  
  def require_user!
    redirect_to new_session_url if current_user.nil?
  end
  
  protect_from_forgery with: :exception
end
