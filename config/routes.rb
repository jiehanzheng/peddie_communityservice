PeddieCommunityservice::Application.routes.draw do
  resources :users
  resources :signups
  resources :shifts
  resources :committees

  match '/auth/:provider/callback', to: 'sessions#create'
  match '/sessions/destroy' => 'sessions#destroy', :via => :delete

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'committees#index'

  # See how all your routes lay out with "rake routes"
end
