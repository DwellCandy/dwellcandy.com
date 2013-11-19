class JobsController < ApplicationController
  def create
    flash[:notice] = []
    job = Job.new
    if params["user"]
      if User.valid_attribute?('phone_number', params["user"]["phone_number"])
        current_user.update_attribute(:phone_number, params["user"]["phone_number"])
        save_job(job)
      else
        flash[:notice] << "Phone number is invalid"
      end
    else
      save_job(job)
    end
    redirect_to user_path(current_user)
  end

  def consultation
  end

  def show
  end

  private

  def save_job(job)
    current_user.jobs << job
    unless job.save
      flash[:notice] << job.errors.full_messages
    end
  end
end