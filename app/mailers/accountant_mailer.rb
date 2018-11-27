class AccountantMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.accountant_mailer.contact.subject
  #
  def contact(body, email_from, subject, email_to)
    @body = body

    mail(to: email_to,
         subject: subject,
         reply_to: email_from)
  end
end
