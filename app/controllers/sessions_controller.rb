class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      # user.try(:authenticate, params[:pasword])
      # cookies[:user_email] = user.email
      session[:user_id] = user.id
      redirect_to home_path, notice: "Signed In"
    else
      flash.now.alert = "Couldn't sign you in. Please check your email and password."
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    flash.now.alert = "Signed Out"
    redirect_to root_url, notice: "Signed out"
  end
end
