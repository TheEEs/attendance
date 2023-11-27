require 'sidekiq/web'
Rails.application.routes.draw do
  
  get 'attend/:conference_id', to: "attend#index"
  get 'attend/:conference_id/attend', to: "attend#attend", as: :attend
  post 'attend/:conference_id/', to: "attend#make_attend", as: :make_attend
  namespace :admin do
    resources :conferences
    resources :delegates
    resources :users

    root to: "conferences#index"
  end

  mount Sidekiq::Web => '/sidekiq'
end
