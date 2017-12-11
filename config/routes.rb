Rails.application.routes.draw do
  resources :avalanche_infomations
  resources :observations
  root to: 'observations#index'
  devise_for :users, path: :members
  namespace :members do
    root to: 'observations#index'
    resources :avalanche_infomations
    resources :observations
    resources :users
    resources :areas
  end
end
