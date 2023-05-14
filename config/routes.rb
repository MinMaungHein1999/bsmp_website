require 'sidekiq/web'
Rails.application.routes.draw do
  mount SwaggerUiEngine::Engine, at: '/api-docs'
  resources :book_categories
  resources :book_authors
  resources :subscribers
  resources :books
  resources :categories
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'
  namespace :api do
    namespace :v1 do
      resources :subscriptions, only: [:create]
    end
  end
end
