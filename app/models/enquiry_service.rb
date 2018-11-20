class EnquiryService < ApplicationRecord
  belongs_to :service
  belongs_to :enquiry
  validates :service_id, uniqueness: { scope: :enquiry_id }
end
