class Enquiry < ApplicationRecord
  belongs_to :user, optional: true
  has_many :quotes, dependent: :destroy
  has_many :enquiry_services, dependent: :destroy
  has_many :services, through: :enquiry_services
  has_many :accountants, through: :quotes

  validates :title, presence: true
  validates :email, format: { with: /[^@]{1,}\@[^@.]{1,}\.[^@]{1,}/ }, presence: true
  validates :description, presence: true
  validates :is_local, inclusion: { in: [true, false] }
  validates :industry, inclusion: { in: INDUSTRIES }, allow_nil: true
end
