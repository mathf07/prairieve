class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :authenticate_user

  def authenticate_user
    redirect_to welcome_path unless current_user
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def track
    binding.pry
    Stat.create_for(current_user) if current_user
  end
end
