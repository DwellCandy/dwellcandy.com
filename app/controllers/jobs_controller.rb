class JobsController < ApplicationController
  def create
    flash[:notice] = []
    job = Job.new
    if params["user"]
      User.valid_attribute?('phone_number', params["user"]["phone_number"])
      binding.pry
      if current_user.update_attribute(:phone_number, params["user"]["phone_number"])
        current_user.jobs << job
        unless job.save
          flash[:notice] << job.errors.full_messages
        end
      else
        flash[:notice] << current_user.errors.full_messages
      end
    else
      current_user.jobs << job
      unless job.save
        flash[:notice] << job.errors.full_messages
      end
    end
    redirect_to user_path(current_user)
  end

  def consultation
  end

  def show
  end
end