class JobsController < ApplicationController
  def create
    binding.pry
    flash[:notice] = []
    job = Job.new
    current_user.jobs << job
    unless job.save
      flash[:notice] << job.errors.full_messages
    end
    redirect_to user_path(current_user)
  end

  def consultation
  end
end