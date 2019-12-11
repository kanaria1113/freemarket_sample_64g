Rails.application.routes.draw do
  devise_for :users
  root to: 'index#index'
  resources :mypage, only: [:index]
  resources :logout, only: [:index]
  resources :sell, only: [:index]
end
