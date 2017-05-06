class User < ApplicationRecord

  has_many :favorites, dependent: :destroy
  has_many :homes, through: :favorites

  def self.from_omniauth(authentication_data)
    if User.where(provider: authentication_data['provider'],
                      uid: authentication_data['uid']).exists?
      user = User.where(provider: authentication_data['provider'],
                      uid: authentication_data['uid']).first
    else
      user = User.where(provider: authentication_data['provider'],
                        uid: authentication_data['uid']).create

      Rails.logger.debug "The user is #{user.inspect}"
      Rails.logger.debug "The authinfo is #{authentication_data.info}"

      user.name         = authentication_data.info.name
      user.nickname     = authentication_data.info.nickname
      user.access_token = authentication_data.info.access_token
      user.profile_url  = authentication_data.info.urls
      user.email        = authentication_data.info.email

      user.save!
      HhMailer.signup_email(user).deliver_later
    end

    Rails.logger.debug "After saving, the user is #{user.inspect}"

    return user
  end
end
