class User < ApplicationRecord
  has_many :jobs
  has_many :registers
  has_many :saves, dependent: :destroy

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def save_job!(job)
    self.saves.create!(job_id: job.id)
  end

  def undo_save!(job)
    save = self.saves.find_by_job_id(job.id)
    save.destroy!
  end

  def saved_job?(job)
    if self.saves.find_by_job_id(job.id)
      true
    else
      false
    end
  end

  def my_saved_jobs
      saves.map(&:job)
  end

end
