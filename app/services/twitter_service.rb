class TwitterService
  attr_reader :connection

  def initialize(user)
    @connection ||= Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV["twitter_api_key"]
      config.consumer_secret     = ENV["twitter_secret"]
      config.access_token        = user.oauth_token
      config.access_token_secret = user.oauth_token_secret
    end
  end

  def retweet(tweet)
    connection.retweet(tweet)
  end

  def unfavorite(tweet)
    connection.unfavorite(tweet)
  end

  def favorite(tweet)
    connection.favorite(tweet)
  end

  def post(message)
    connection.update(message)
  end

  def tweets
    connection.home_timeline
  end

  def twitter_user
    @twitter_user ||= connection.user
  end

  def followers
    twitter_user.followers_count
  end

  def following
    twitter_user.friends_count
  end

  def unfollow(screen_name)
    connection.unfollow(screen_name)
  end
end
