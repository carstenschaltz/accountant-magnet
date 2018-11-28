class AccountantIndustry < ApplicationRecord
  belongs_to :accountant
  belongs_to :industry
  validates :industry_id, uniqueness: { scope: :accountant_id }
end
