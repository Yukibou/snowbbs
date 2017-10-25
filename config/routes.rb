Rails.application.routes.draw do
  resources :observations
  root to: 'observations#index'
  devise_for :users
  resources :users
end
