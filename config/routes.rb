Rails.application.routes.draw do
  root 'landing#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  scope '(:locale)', locale: /en|vi/ do
    devise_for :users, controllers: { passwords: 'user/passwords' }

    resources :access_requests, only: %i(new create edit update)
    get 'access_requests/success', to: 'access_requests#success'

    namespace :admin do
      get '/', to: 'dashboards#index'
      resources :dashboards, only: %i(index)
      resources :access_requests, only: %i(index show edit update) do
        post :accept, on: :member
        patch :reject, on: :member
      end
    end

    namespace :customer do
      get '/', to: 'dashboards#index'
      resources :dashboards, only: %i(index)
      resources :access_tokens, only: %i(index) do
        patch :reset, on: :collection
      end
    end

    namespace :api do
      namespace :v1, defaults: {format: :json}  do
        resource :invoices, only: %i(create)

      end
    end
  end
end
