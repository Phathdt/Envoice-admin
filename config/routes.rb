Rails.application.routes.draw do
  root 'landing#index'
  require 'sidekiq/web'
  mount Sidekiq::Web => '/sidekiq'

  scope '(:locale)', locale: /en|vi/ do
    devise_for :users, controllers: { passwords: 'user/passwords' }

    resources :access_requests, only: %i(new create edit update)
    get 'access_requests/success', to: 'access_requests#success'

    resources :invoices, only: %i(index) do
      post :search, on: :collection
    end

    namespace :admin do
      get '/', to: 'access_requests#index'
      resources :access_requests, only: %i(index show edit update) do
        post :accept, on: :member
        patch :reject, on: :member
      end
      get '/company_invoices', to: 'invoices#by_companies'
      resources :companies, only: %i() do
        resources :invoices, only: %i(show) do
          get '/', to: 'invoices#index', on: :collection, as: 'index'
        end

      end
    end

    namespace :customer do
      get '/', to: 'dashboards#index'
      resources :dashboards, only: %i(index)
      resources :access_tokens, only: %i(index) do
        patch :reset, on: :collection
      end
      resources :invoices, only: %i(index show)
    end

    namespace :api do
      namespace :v1, defaults: {format: :json}  do
        resource :invoices, only: %i(create) do
          patch :cancle, on: :collection
        end
      end
    end
  end
end
