PeddieCommunityservice::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create', via: [:get, :post]
  post '/sessions/destroy'

  resources :committees
  resources :signups

  root 'committees#index'
end
