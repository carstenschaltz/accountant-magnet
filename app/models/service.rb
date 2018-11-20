class Service < ApplicationRecord
  has_many :enquiry_services
  has_many :enquiries, through: :enquiry_services
  has_many :accountant_services
  has_many :accountants, through: :accountant_services
  validates :name, presence: true, inclusion: { in: SERVICES }, uniqueness: true
end
