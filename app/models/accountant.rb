class Accountant < ApplicationRecord
  validates :name, presence: true
  validates :email, uniqueness: true
  validates :qualification, inclusion: { in: QUALIFICATIONS }, allow_nil: true
  has_many :quotes
  has_many :accountant_services
  has_many :services, through: :accountant_services
end
