# Preview all emails at http://localhost:3000/rails/mailers/quote_mailer
class QuoteMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/quote_mailer/created
  def created
    QuoteMailer.created
  end

end
