class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :authenticate_user
  after_filter :track_action

  def authenticate_user
    redirect_to welcome_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  protected

  def track_action
    ahoy.track "Page view", "#{controller_name}##{action_name}"
  end
end
