class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in_user
    return true if session[:user_id]
    return false
  end

  def authorize
    redirect_to login_path, alert: 'You must be logged in to access this page.' if current_user.nil?
  end

  def random_background
    @randomback = ["backone","backtwo","backthree"].shuffle.first
  end
end
