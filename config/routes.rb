Rails.application.routes.draw do
  resources :book_categories
  resources :book_authors
  resources :subscribers
  resources :books
  resources :categories
  resources :authors
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
