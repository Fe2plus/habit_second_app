Rails.application.routes.draw do

  get 'posts/new'

  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'

  root 'users#index'
end
