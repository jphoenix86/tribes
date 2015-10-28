class UserPresenter
  attr_reader :user, :service

  def initialize(user)
    @user = user
    @service = TwitterService.new(user)
  end

  def banner_image
    user.banner_image
  end

  def profile_image
    user.profile_image
  end

  def name
    user.name
  end

  def screen_name
    user.screen_name
  end

  def statuses
    tweets
  end

  def tweets
    service.tweets
  end

  def followers
    service.followers
  end

  def following
    service.following
  end
end
