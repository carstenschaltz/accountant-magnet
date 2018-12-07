class Quote < ApplicationRecord
  after_create :send_quote_create_email

  belongs_to :enquiry
  belongs_to :accountant
  validates :message, presence: true
  validates :invite, inclusion: { in: [true, false] }

  def send_quote_create_email
    QuoteMailer.created(self).deliver_now
  end
end
