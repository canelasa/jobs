class RegistersController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @register = Register.new
  end

  def create
    @job = Job.find(params[:job_id])
    @job.registers.create(register_params.merge(user: current_user))
    redirect_to job_path(@job)
  end

  def edit
    @job = Job.find(param[:id])
    @register = @job.registers.find(params[:id])
  end

  def update
    @job = Job.find(params[:job_id])
    @job.registers.update_attributes(register_params)
    redirect_to user_path(current_user)
  end

  def destroy
   @job = Job.find(params[:job_id])
   @register = @job.registers.find(params[:id])
   @register.destroy
   redirect_to user_path(current_user), :notice => "Lesson Deleted"
  end

  private

  def register_params
    params.require(:register).permit(:full_name, :phone_number, :email, :address, :city, :state, :zip, :month,
                                      :highschool, :college, :location, :years, :major, :company_name, :job_title, :description, :goals)
  end
end
