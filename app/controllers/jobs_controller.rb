class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index
     if params[:search]
       jobs = Job.search(params[:search])
     elsif params[:sort]
       jobs = sort_jobs
     else
       jobs = Job.all
     end
     @jobs = jobs.paginate(:page => params[:page], :per_page => 2)
  end

  def sort_jobs
    jobs = if params[:sort] == "date"
      Job.order_by_date
    elsif params[:sort] == "city"
      Job.order_by_city
    else
      Job.all
    end
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

    if @job.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @job.update_attributes(job_params)
    if @job.valid?
      redirect_to jobs_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @job = Job.find(params[:id])
    if @job.user != current_user
      return render text: 'Not Allowed', status: :forbidden
    end

    @job.destroy
    redirect_to jobs_path
  end
  private

  def job_params
    params.require(:job).permit(:name, :address, :city, :state, :title, :description, :responsibilities, :requirements, :skills, :majors)
  end
end
