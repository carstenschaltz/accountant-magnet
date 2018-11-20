class AccountantService < ApplicationRecord
  belongs_to :service
  belongs_to :accountant
  validates :service_id, uniqueness: { scope: :accountant_id }
end
