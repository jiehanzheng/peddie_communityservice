PeddieCommunityservice::Application.routes.draw do
  resources :users
  resources :signups
  resources :committees

  match '/auth/:provider/callback' => 'sessions#create'
  match '/sessions/destroy' => 'sessions#destroy', :via => :delete

  match '/sessions/secret_signin_page' => 'sessions#secret_signin_page', :as => 'cheating_login_page'
  match '/sessions/secret_signin' => 'sessions#secret_signin', :via => :post

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => 'committees#index'

  # See how all your routes lay out with "rake routes"
end
