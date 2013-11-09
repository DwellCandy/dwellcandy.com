class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    login user
    redirect_to root_url
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end