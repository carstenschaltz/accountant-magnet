class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enquiries
  validates :name, presence: true
  validates :email, format: { with: /[^@]{1,}\@[^@.]{1,}\.[^@]{1,}/ }, uniqueness: true
  validates :company_size, inclusion: { in: COMPANY_SIZES }, allow_nil: true
  validates :company_industry, inclusion: { in: INDUSTRIES }, allow_nil: true
end
