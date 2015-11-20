Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"

  get 'users/:id', to: 'users#show', as: 'user'
  get 'users', to: 'users#index'

  get '/books', to: 'books#all_books', as: 'all_books'

  resources :books, only: [:index, :show] do
    get 'owners/:id', to: 'books#show_owner', as: 'owner'
    get 'owners', to: 'books#owners', as: 'owners'
  end

  resources :user do
    resources :books, only: [:index, :show]
    post 'books/:id', to: 'books#add_book_to_user', as: 'add_book'
    put 'books/:id', to: 'books#remove_book_from_user', as: 'remove_book'
  end
end
