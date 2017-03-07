class Job < ApplicationRecord
  belongs_to :user
  validates :name, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
end
