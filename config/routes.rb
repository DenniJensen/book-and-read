Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
  get "/imprint", to: "home#imprint", as: "imprint"

  resources :rentals
  resources :searched_books, only: :create

  resources :available_books, only: [:index, :show]

  resources :books, only: [:show, :new] do
    resources :owners, only: [:index, :show]
  end

  resources :borrow_requests, only: :create

  resources :users, only: [:index, :show] do
    resources :rentals, only: [:index]
    resources :borrow_requests, only: [:index, :show, :destroy]

    resources :books do
      resources :borrow_requests, only: [:new]
    end
  end
end
