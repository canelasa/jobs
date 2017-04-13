class SavesController < ApplicationController
  respond_to :js

  def save
    @user = current_user
    @job = Job.find(params[:job_id])
    @user.save_job!(@job)
  end

  def undo
    @user = current_user
    @save = @user.saves.find_by_job_id(params[:job_id])
    @job = Job.find(params[:job_id])
    @save.destroy!
  end
end
