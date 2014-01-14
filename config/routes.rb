PeddieCommunityservice::Application.routes.draw do
  match '/sessions/create', via: [:get, :post] if Rails.env.test?
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post '/sessions/destroy'

  resources :committees
  resources :signups

  root 'committees#index'
end
