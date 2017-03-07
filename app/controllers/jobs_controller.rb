class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  def index
     @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.create(job_params)
    if @job.valid?
      redirect_to jobs_path
    else
      render :new, status: :uprocessable_entity
    end
  end

  def show
    @job = Job.find(params[:id])
  end

  def edit
    @job = Job.find(params[:id])
  end

  def update
    @job = Job.find(params[:id])
    @job.update_attributes(job_params)
    redirect_to job_path
  end
  
  private

  def job_params
    params.require(:job).permit(:name, :address, :city, :state, :title, :description, :responsibilities, :requirements, :skills, :majors)
  end
end
