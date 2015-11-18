Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"

  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index'

  post '/books', to: 'books#search', as: 'book_search'

  resources :books, only: [:index, :show] do
    get 'users/:id', to: 'books#users', as: 'owner'
    get 'users', to: 'books#owners', as: 'owners'
  end

  resources :user do
    resources :books, only: [:index, :show]
    get 'books', to: 'user#books', as: 'user_books'
  end

end
