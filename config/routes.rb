Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'lists#index'
  resources :lists do
    member do
      patch :move
    end
    resources :reviews, only: [:new, :create]
  end
  resources :bookmarks, only: [:new, :create, :destroy]
  resources :reviews, only: [:destroy]
end
