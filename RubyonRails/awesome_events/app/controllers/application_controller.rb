class ApplicationController < ActionController::Base
  helper_method :logged_in?
  
  private
  def logged_in?
    !!session[:user_id]
  end
  
  # def current_user
  #  
  #   return unless session[:user_id]
  #   @current_user ||= User.find(session[:user_id])
  #   # @current_user = User.first
  # end
  #
  # def authenticate
  #   return if logged_in?
  #   redirect_to root_path, alert: "ログインしてください"
  # end
end
