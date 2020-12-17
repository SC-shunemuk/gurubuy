Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    resources :orders, only: [:index, :create]
    resources :purchases, only: [:index, :create]
  end
  resources :users, only: :show
end
