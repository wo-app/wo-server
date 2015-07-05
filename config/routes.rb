Rails.application.routes.draw do
  resources :organizations, only: [:create]
  resources :doings, only: [:create]
  resources :users, only: [:index]
end
