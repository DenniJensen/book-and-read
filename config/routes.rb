Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"

  resources :rentals
  resources :searched_books, only: :index

  resources :available_books, only: :index

  resources :books, only: [:show, :new] do
    resources :owners, only: [:index, :show]
  end

  resources :users, only: [:index, :show] do
    resources :borrow_requests, only: :index

    resources :books do
      resources :borrow_requests, only: :create
    end
  end
end
