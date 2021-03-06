Rails.application.routes.draw do
  root 'home#top'
  get '/about' => "home#about"

  devise_for :admins, controllers:{
  	sessions: 'admins/sessions',
  }

  devise_for :users, controllers:{
  	sessions: 'users/sessions',
  	registrations: 'users/registrations'
  }
  resources :posts do
    resource :post_comments, only: [:create, :destroy]
    resource :favorites, only: [:create, :destroy]
  end

  resources :genres, only: [:show]


  namespace :admins do
  	resources :users
  end

  namespace :admins do
  	resources :genres
  end

  namespace :admins do
  	resources :posts
  end

  resources :users do
  	member do
  	  get :following, :followers
  	end
  end

  resources :relationships, only: [:create, :destroy]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
