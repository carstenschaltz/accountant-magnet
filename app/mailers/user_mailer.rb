class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.created.subject
  #
  def created(user)
    @body = "User created!\nName: #{user.name}\nId: #{user.id}\nEmail: #{user.email}"

    mail(to: "carsten@stotles.com", subject: "User created: #{user.email}")
  end
end
