class SessionsController < ApplicationController
  def create
    flash[:notice] = []
    if params[:session]
      user = User.find_by_email(params[:session][:email])
      binding.pry
      if user && user.authenticate(params[:session][:password])
        login user
      else
        flash[:notice] << "Invalid email or password"
      end
    else
      user = User.from_omniauth(env["omniauth.auth"])
      login user
    end
    redirect_to root_url #stub
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end