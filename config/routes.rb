Rails.application.routes.draw do
  devise_for :users, :controllers => {
    omniauth_callbacks: 'callbacks',
    registrations: 'registrations'
  }

  root to: "home#index"
  get "/imprint", to: "home#imprint", as: "imprint"

  resources :rentals, only: :create

  resources :searched_books, only: [:index, :create]

  resources :available_books, only: [:index, :show]

  resources :books, only: [:show] do
    resources :owners, only: [:index, :show]
  end
  resources :borrow_requests, only: :create

  resources :users, only: [:index, :show] do
    resources :rentals, only: [:index, :show, :destroy]
    resources :borrow_requests, only: [:index, :show, :update, :destroy]
    resources :books do
      resources :borrow_requests, only: [:new]
    end
  end
end
