Rails.application.routes.draw do
  devise_for :users
  resources :customers do
    collection do
      get :search
    end
  end
  resources :equipaments do
    collection do
      get :search
    end
  end
  resources :orders
  root "customers#index"
end
