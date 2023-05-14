require 'sidekiq/web'
Rails.application.routes.draw do
  resources :book_categories
  resources :book_authors
  resources :subscribers
  resources :books
  resources :categories
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  mount Sidekiq::Web => '/sidekiq'
  root 'admin/books#index'
  namespace :api do
    post 'subscribe', to: 'subscribers#create'
  end 
end
