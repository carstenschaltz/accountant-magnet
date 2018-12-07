class EnquiryMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.enquiry_mailer.created.subject
  #
  def created(enquiry)
    @body = "Enquiry created!\nTitle: #{enquiry.title}\nId: #{enquiry.id}\nEmail: #{enquiry.email}\nDescription: #{enquiry.description}"

    mail(to: "carsten@accountant-magnet.com", subject: "Enquiry created: #{enquiry.title}")
  end
end
