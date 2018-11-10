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

    namespace :api do
      namespace :v1, defaults: {format: :json}  do
        mount_devise_token_auth_for 'User',
          at: '/auth',
          skip: [:invitation, :password] ,
          controllers: {
            sessions:  'overrides/sessions',
            token_validations: 'overrides/token_validations'
          }

      end
    end
  end
end
