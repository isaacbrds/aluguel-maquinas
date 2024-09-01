Rails.application.routes.draw do
  devise_for :users
  resources :customers
  resources :equipaments
  root "customers#index"
end
