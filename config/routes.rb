Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"

  resources :searched_books, only: :index

  resources :books, only: [:show, :new] do
    resources :owners, only: [:index, :show]
  end

  resources :users, only: [:index, :show] do
    resource :borrow_requests, only: :index
    resources :books do
      resource :borrow_requests
    end
  end
end
