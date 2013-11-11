class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      login user
      redirect_to user_path user
    else
      flash[:notice] = user.errors.full_messages
      redirect_to root_path
    end
  end

  def show
    @job = Job.new
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end
end