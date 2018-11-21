class Quote < ApplicationRecord
  belongs_to :enquiry
  belongs_to :accountant
  validates :message, presence: true
  validates :invite, inclusion: { in: [true, false] }
end
