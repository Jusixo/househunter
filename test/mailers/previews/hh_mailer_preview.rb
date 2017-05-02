# Preview all emails at http://localhost:3000/rails/mailers/hh_mailer
class HhMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hh_mailer/welcome
  def welcome
    HhMailer.welcome
  end

  # Preview this email at http://localhost:3000/rails/mailers/hh_mailer/favorite
  def favorite
    HhMailer.favorite
  end

  # Preview this email at http://localhost:3000/rails/mailers/hh_mailer/newsletter
  def newsletter
    HhMailer.newsletter
  end

end
