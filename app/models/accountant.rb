class Accountant < ApplicationRecord
  validates :name, presence: true
  # validates :qualification, allow_nil: true, inclusion: { in: QUALIFICATIONS }
  has_many :quotes
  has_many :accountant_services
  has_many :services, through: :accountant_services
  has_many :accountant_industries
  has_many :industries, through: :accountant_industries
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
