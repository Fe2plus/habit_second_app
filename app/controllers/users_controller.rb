class UsersController < ApplicationController

  def index
    @user = current_user
    if @user.present?
      @posts = Post.order('create_at desc')
      @post = current_user.posts.build if logged_in?
    else
      # TODO 後で書く
    end
  end
end
