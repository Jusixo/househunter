class HhMailer < ApplicationMailer
  default from: "thisisfake@fake.com"

  def welcome(user)
    @user = user

    mail(to: @user.email, subject: 'Welcome to House Hunters!')
  end

  def favorites(home, current_user)
    @home = home
    @current_user = current_user
    mail(to: @home.created_by.email, subject: "Someone favorited the house you listed!")
  end

  def weekly(home)
    @home = home

    mail subject: "New homes added this week!",
         to: "someone@blank.com",
         bcc: User.all.pluck(:email)
  end
end
