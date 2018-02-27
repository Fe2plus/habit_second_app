Rails.application.routes.draw do

  resources :posts, :only => [:create, :destroy]
  get 'auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  root 'users#index'
end
