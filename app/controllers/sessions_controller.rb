class SessionsController < ApplicationController
  def create
    omniauth = request.env['omniauth.auth']
    user = User.find_or_create_from_auth(omniauth)
    session[:user_id] = user.id
    omniauth.credentials.token
    omniauth.credentials.secret
    redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    reset_session
    redirect_to root_path
  end
end
