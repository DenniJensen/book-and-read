Rails.application.routes.draw do
  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index'
  post '/books', to: 'books#search', as: 'book_search'

  resources :books, only: [:index, :show] do
    resources :users, only: [:index, :show]
  end

  resources :user do
    resources :books, only: [:index, :show]
    resources :user, only: [:index, :show]
  end

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
end
