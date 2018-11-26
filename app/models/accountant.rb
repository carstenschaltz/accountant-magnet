class Accountant < ApplicationRecord
  validates :name, presence: true
  # validates :qualification, allow_nil: true, inclusion: { in: QUALIFICATIONS }
  has_many :quotes
  has_many :accountant_services
  has_many :services, through: :accountant_services

  include PgSearch
  pg_search_scope :search_by_service, associated_against: { service: :name }

  # scope :location, ->(place) { near(place) }
  scope :service, ->(accounting_services) { joins(accountant_services: :service).where('services.name' => accounting_services) }
end
