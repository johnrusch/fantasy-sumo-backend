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
      get '/user_leagues', to:
      'leagues#user_leagues'
      get '/open_leagues', to:
      'leagues#open_leagues'
      post 'leagues/:id/start_draft', to:
      'leagues#start_draft'
      get '/wrestlers', to:
      'wrestlers#index'
      mount ActionCable.server => '/cable'
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
