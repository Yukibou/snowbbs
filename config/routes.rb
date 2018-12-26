Rails.application.routes.draw do
  resources :avalanche_infomations
  resources :observations
  get 'avalanche_infomations/latest_by_area/:area_id', to: 'avalanche_infomations#latest_by_area'
  root to: 'observations#index'
  devise_for :users, path: :members
  namespace :members do
    resources :dashboards, only: [:index]
    root to: 'observations#index'
    resources :avalanche_infomations
    resources :observations do
      resources :images, only: [:create, :destroy]
    end
    resources :users
    resources :areas
    resources :avalanche_areas
  end
end
