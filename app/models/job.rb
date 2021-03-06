class Job < ApplicationRecord
  belongs_to :user
  has_many :registers
  has_many :saves, dependent: :destroy
  
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

  def posted
    created_at.strftime("%m/%d/%Y")
  end

  def self.order_by_city
    order(:city)
  end

  def self.order_by_major
    order(:major)
  end

end
