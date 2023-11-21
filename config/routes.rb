Rails.application.routes.draw do
  namespace :admin do
    resources :conferences
    resources :delegates
    resources :users

    root to: "conferences#index"
  end
end
