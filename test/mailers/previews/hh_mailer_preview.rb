# Preview all emails at http://localhost:3000/rails/mailers/hh_mailer
class HhMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/hh_mailer/welcome
  def welcome
<<<<<<< HEAD
    HhMailer.welcome
=======
    HhMailer.welcome(User.first)
>>>>>>> 33a2a16302cd13e30f994602051fd115a1b09b64
  end

  # Preview this email at http://localhost:3000/rails/mailers/hh_mailer/favorite
  def favorite
<<<<<<< HEAD
    HhMailer.favorite
=======
    HhMailer.favorite(Home.first, User.last)
>>>>>>> 33a2a16302cd13e30f994602051fd115a1b09b64
  end

  # Preview this email at http://localhost:3000/rails/mailers/hh_mailer/newsletter
  def newsletter
<<<<<<< HEAD
    HhMailer.newsletter
=======
    HhMailer.newsletter(Home.all)
>>>>>>> 33a2a16302cd13e30f994602051fd115a1b09b64
  end

end
