require 'sidekiq/web'

Rails.application.routes.draw do  
  resources :user_roles
  resources :meetings
  root to: 'home#index'
  
  #get 'users', action: :index, controller: 'users'  
  #get 'user/:id', action: :show, controller: 'users'


  resources :tasks
  resources :products
  resources :shops
  resources :tenants do
    resources :users
  end
  draw :madmin
  get '/privacy', to: 'home#privacy'
  get '/terms', to: 'home#terms'
authenticate :user, lambda { |u| u.has_role? :superadmin } do
  mount Sidekiq::Web => '/sidekiq'

  namespace :madmin do
    resources :impersonates do
      post :impersonate, on: :member
      post :stop_impersonating, on: :collection
    end
  end
end

  resources :notifications, only: [:index]
  resources :announcements, only: [:index]
  devise_for :admins, :path_prefix => 'admin'
  devise_for :users, controllers: { registrations: 'users/registrations' }, :path_prefix => 'my'
  resources :users, only: [:index]
 
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
