class QuoteMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.quote_mailer.created.subject
  #
  def created(quote)
    @body = "Quote created!\nQuote Id: #{quote.id}\nQuote message: #{quote.message}\nEnquiry: #{quote.enquiry.title}\nUser: #{quote.enquiry.user.email}"

    mail(to: "carsten@accountant-magnet.com", subject: "Quote created: #{quote.id} - #{quote.message}")
  end
end
