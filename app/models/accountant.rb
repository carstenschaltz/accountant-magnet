class Accountant < ApplicationRecord
  validates :name, presence: true
  # validates :qualification, allow_nil: true, inclusion: { in: QUALIFICATIONS }
  has_many :quotes
  has_many :accountant_services
  has_many :services, through: :accountant_services
end
