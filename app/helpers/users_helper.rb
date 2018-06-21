module UsersHelper
  #FRIENDS_COUNT = 10.freeze
=begin
  def get_follower
    client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_KEY']
      config.consumer_secret = ENV['TWITTER_SECRET']
      # ユーザー情報の設定
      config.access_token = @current_user.twitter_token
      config.access_token_secret  = @current_user.twitter_secret
    end
    screen_names = client.friends.collect {|f| client.user(f).screen_name }
    five_names = screen_names.take(1)
    puts (five_names)
  end
=end

=begin
  def get_follower
    @twitter ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV["CONSUMER_KEY"]
      config.consumer_secret = ENV["CONSUMER_SECRET"]
      config.access_token = @current_user.twitter_token
      config.access_token_secret = @current_user.twitter_secret
    end
    response = @twitter.friends(cursor: params[:cursor], count: FRIENDS_COUNT)
    @next = response.attrs[:next_cursor]
    @friends = response.take(FRIENDS_COUNT)
  end
=end
end
