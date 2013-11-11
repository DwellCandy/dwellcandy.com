class SessionsController < ApplicationController
  def create
    flash[:notice] = []
    if params[:session]
      if user = User.find_by_email(params[:session][:email].downcase)
        if user.facebook == true
          flash[:notice] << "Please log in using facebook"
        elsif user && user.authenticate(params[:session][:password])
          login user
        else
          flash[:notice] << "Invalid email or password"
        end
      else
        flash[:notice] << "Invalid email or password"
      end
    else
      auth = env["omniauth.auth"]
      if user = User.find_by_email(auth.info.email)
      else
        user = User.new
      end
      user.from_omniauth(auth)
      if user.save
        login user
      else
        flash[:notice] << "There was an error logging in with Facebook"
      end
    end
    redirect_to root_url #stub
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url
  end
end