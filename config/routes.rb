Rails.application.routes.draw do
  root 'landing#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  scope '(:locale)', locale: /en|vi/ do
    devise_for :users, controllers: { passwords: 'user/passwords' }

    resources :access_requests, only: %i(new create success edit update)

    namespace :admin do
      get '/', to: 'dashboards#index'
      resources :dashboards, only: %i(index)
      resources :access_requests, only: %i(index show edit update) do
        post :accept, on: :member
        patch :reject, on: :member
      end
    end
  end
end
