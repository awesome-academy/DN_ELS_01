Rails.application.routes.draw do
  root "static_pages#home"

  resources :users, only: :show
  resources :words, only: :index
end
