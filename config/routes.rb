Rails.application.routes.draw do
  namespace :admin do
      resources :conferences
      resources :delegates
      resources :users

      root to: "conferences#index"
    end
  get 'home/index'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
