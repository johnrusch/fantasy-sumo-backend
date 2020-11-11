Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :matches
      resources :leagues
      resources :wrestlers
      resources :teams
      resources :users
      post '/auth', to:
      'auth#create'
      get '/current_user', to:
      'auth#show'
      get '/banzuke', to:
      'wrestlers#banzuke'
      get '/user_leagues', to:
      'leagues#user_leagues'
      get '/open_leagues', to:
      'leagues#open_leagues'
      mount ActionCable.server => '/cable'
      patch '/leagues/:id', to:
      'leagues#add_user_to_league'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
