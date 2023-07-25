class ApplicationController < ActionController::Base
  before_action :authenticate
  helper_method :logged_in?, :current_user

  rescue_from Exception, with: :error500
  rescue_from ActiveRecord::RecordNotFound, ActionController::RoutingError, with: :error404

  private
  def logged_in?
    !!session[:user_id]
  end

  def current_user
    return unless session[:user_id]
    @current_user ||= User.find(session[:user_id])
  end

  def authenticate
    return if logged_in?
    redirect_to root_path, alert: "ログインしてください"
  end

  def error404(e)
    render "error404", status: 404,formats: [:html]
  end

  def error500(e)
    logger.error [e, *e.backtrace].join("\n")
    render "error500", status: 500, formats: [:html]
  end
end
