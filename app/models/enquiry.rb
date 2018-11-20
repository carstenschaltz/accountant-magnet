class Enquiry < ApplicationRecord
  belongs_to :user
  has_many :quotes
  has_many :enquiry_services
  has_many :services, through: :enquiry_services
  has_many :accountants, through: :quotes

  validates :title, presence: true
  validates :description, presence: true
  validates :is_local, inclusion: { in: [true, false] }
end