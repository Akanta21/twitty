class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user
  helper_method :user_logged_in?

def current_user
  @c_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
  # User.find(session[:user_id] ) unless session[:user_id].blank?
  # if @c_user.present?
  #   return @c_user
  # elsif session[:user_id].present?
  #   @c_user = User.find(session[:user_id])
  #   return @c_user
  # else
  #   return nil
  # end
end

def user_logged_in?
  current_user.present?
end

def authenticate_user
  unless user_logged_in?
    flash[:error] = "Please login first"
    redirect_to home_url
  end
end
end
