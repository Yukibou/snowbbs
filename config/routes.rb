Rails.application.routes.draw do
  resources :avalanche_infomations
  resources :observations

  root to: 'observations#index'
  devise_for :users

  # devise_for :admins, controllers: {
  #     sessions: "admins/sessions",
  #     registrations: "admins/registrations"
  # }
  namespace :members do
    root to: 'observations#index'
    resources :avalanche_infomations
    resources :observations
    resources :users
    resources :areas
  end
end
