Rails.application.routes.draw do
  resources :books

  devise_for :users, :controllers => { :omniauth_callbacks => "callbacks" }
  root to: "home#index"
end
