class User < ApplicationRecord
  after_create :attach_enquiries

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :enquiries, dependent: :destroy
  validates :name, presence: true
  validates :email, format: { with: /[^@]{1,}\@[^@.]{1,}\.[^@]{1,}/ }, uniqueness: true
  validates :company_size, inclusion: { in: COMPANY_SIZES }, allow_nil: true
  validates :company_industry, inclusion: { in: INDUSTRIES }, allow_nil: true

  private

  def attach_enquiries
    Enquiry.where(email: email, user_id: nil).each do |enquiry|
      enquiry.update(user: self)
    end
  end
end
