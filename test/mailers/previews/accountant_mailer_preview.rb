# Preview all emails at http://localhost:3000/rails/mailers/accountant_mailer
class AccountantMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/accountant_mailer/contact
  def contact
    AccountantMailer.contact
  end

end
