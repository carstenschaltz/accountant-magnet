class Accountant < ApplicationRecord
  validates :name, presence: true
  # validates :qualification, allow_nil: true, inclusion: { in: QUALIFICATIONS }
  has_many :quotes
  has_many :accountant_services
  has_many :services, through: :accountant_services
  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?
end
