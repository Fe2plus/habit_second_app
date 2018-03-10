class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      client = Twitter::REST::Client.new do |config|
        # applicationの設定
        config.consumer_key = ENV['TWITTER_KEY']
        config.consumer_secret = ENV['TWITTER_SECRET']
        # ユーザー情報の設定
        config.access_token = @current_user.twitter_token
        config.access_token_secret  = @current_user.twitter_secret
      end
      # Twitter投稿
      client.update("@"+@post.friend+"　とてもとても"+@post.habit)
      redirect_to root_path, notice: 'ツイートしました！'
    else
      render root_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:habit, :friend)
  end
end
