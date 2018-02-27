class UsersController < ApplicationController
  def index
    @user = current_user
    @posts = Post.order('create_at desc')
  end
end
