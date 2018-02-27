class UsersController < ApplicationController
  def index
    @user = current_user
    @posts = Post.order('create_at desc')
    @post = current_user.posts.build if logged_in?
  end
end
