class HhMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hh_mailer.welcome.subject
  #
  def welcome
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hh_mailer.favorite.subject
  #
  def favorite
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.hh_mailer.newsletter.subject
  #
  def newsletter
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
