class User < ActiveRecord::Base
  def service
    @service ||= TwitterService.new(self)
  end

  def self.banner_converter(auth_info)
    auth_info.extra.raw_info.profile_banner_url + "/600x200"
  end

  def self.from_omniauth(auth_info)
    where(uid: auth_info[:uid]).first_or_create do |new_user|
      new_user.name               = auth_info.extra.raw_info.name
      new_user.screen_name        = auth_info.extra.raw_info.screen_name
      new_user.banner_image       = User.banner_converter(auth_info)
      new_user.profile_image      = auth_info.info.image
      new_user.oauth_token        = auth_info.credentials.token
      new_user.oauth_token_secret = auth_info.credentials.secret
    end
  end

  delegate :unfollow, :post, :retweet, :favorite, :unfavorite, to: :service
end
