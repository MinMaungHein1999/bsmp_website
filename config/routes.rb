require 'sidekiq/web'
Rails.application.routes.draw do
  resources :bkjobs
  resources :book_categories
  resources :book_authors
  resources :subscribers
  resources :books
  resources :categories
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  put '/admin/sidekiq_jobs/clear_queue', to: 'admin/sidekiq_jobs#clear_queue', as: 'admin_clear_queue'
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'
  root 'admin/books#index'
  namespace :api do
    post 'subscribe', to: 'subscribers#create'
  end 
end
