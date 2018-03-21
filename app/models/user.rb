class User < ActiveRecord::Base
  has_many :posts

  def self.find_or_create_from_auth(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]
    image_url = auth[:info][:image]
    twitter_token = auth.credentials.token
    twitter_secret = auth.credentials.secret

    self.find_or_create_by(provider: provider, uid: uid) do |user|
      user.nickname = nickname
      user.image_url = image_url
      user.twitter_token = twitter_token
      user.twitter_secret = twitter_secret
    end
  end
end

##twitter_tokenの暗号化？gemとデザインの検討
