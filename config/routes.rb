Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :items do
    collection do
      get 'search'
      get 'search_category'
    end
    resources :orders, only: [:index, :create]
    resources :purchases, only: [:index, :create]
    resources :comments
  end
  resources :users, only: :show
end
