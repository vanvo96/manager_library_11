Rails.application.routes.draw do
  get "/signup", to: "users#new"
  namespace :admin do
    resources :categories
    resources :publishers
    resources :authors
    resources :books
    resources :users
  end
end
