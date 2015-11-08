Rails.application.routes.draw do
  resources :books, only: [:index, :show]
  post '/books', to: 'books#search', as: 'book_search'

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
end
