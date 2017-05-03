class User < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :homes, through: :favorites

  def self.from_omniauth(authentication_data)
    user = User.where(provider: authentication_data['provider'],
                      uid: authentication_data['uid']).first_or_create

    Rails.logger.debug "The user is #{user.inspect}"
    Rails.logger.debug "The oauth info is #{authentication_data.info.inspect}"

    user.name         = authentication_data.info.name
    user.nickname     = authentication_data.info.nickname
    user.access_token = authentication_data.info.access_token
    user.email        = authentication_data.info.email

    user.save!

    Rails.logger.debug "After saving, the user is #{user.inspect}"

    HhMailer.welcome(user).deliver_later

    return user
  end
end
