class HhMailer < ApplicationMailer
<<<<<<< HEAD

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hh_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
=======
  default from: "email@gmail.com"

  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to House Hunters!')
>>>>>>> 33a2a16302cd13e30f994602051fd115a1b09b64
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
<<<<<<< HEAD
  #   en.hh_mailer.favorite.subject
  #
  def favorite
    @greeting = "Hi"

    mail to: "to@example.org"
=======
  #   en.sherlock_mailer.favorites.subject
  #
  def favorite(home, current_user)
    @home = home
    @current_user = current_user
    mail(to: @home.created_by.email, subject: "Someone favorited the house you listed")
>>>>>>> 33a2a16302cd13e30f994602051fd115a1b09b64
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
<<<<<<< HEAD
  #   en.hh_mailer.newsletter.subject
  #
  def newsletter
    @greeting = "Hi"

    mail to: "to@example.org"
=======
  #   en.sherlock_mailer.weekly.subject
  #
  def newsletter(home)
    @home = home

    mail subject: "New homes added this week",
      to: "email@gmail.com",
      bcc: User.all.pluck(:email)
>>>>>>> 33a2a16302cd13e30f994602051fd115a1b09b64
  end
end
