class Job < ApplicationRecord
  belongs_to :user
  has_many :registers
  validates :name, presence: true
  validates :title, presence: true
  validates :city, presence: true
  validates :description, presence: true

  def self.search(query)
    where("lower(city) LIKE ? OR lower(title) LIKE ? OR majors LIKE ?", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%")
  end

  def self.order_by_date
    order(:created_at)
  end
end
