Rails.application.routes.draw do
  get "/signup", to: "users#new"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete '/logout',  to: 'sessions#destroy'
  namespace :admin do
    resources :categories
    resources :publishers
    resources :authors
    resources :books
    resources :users
  end
end
