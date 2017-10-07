Rails.application.routes.draw do
  resources :observations
  root to: 'visitors#index'
  devise_for :users
  resources :users
end
