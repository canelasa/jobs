class Job < ApplicationRecord
  belongs_to :user
  has_many :registers
  validates :name, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true
end
