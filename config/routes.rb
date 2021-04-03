Rails.application.routes.draw do
  get 'item/index'
  root to: 'items#index'
  devise_for :users
  resources :items
end
