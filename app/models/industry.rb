class Industry < ApplicationRecord
  has_many :accountant_industries
  has_many :accountants, through: :accountant_industries
  validates :name, presence: true, uniqueness: true
end
