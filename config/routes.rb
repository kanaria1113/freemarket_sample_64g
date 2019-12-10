Rails.application.routes.draw do
  devise_for :users
  root to: 'mypage#index'
  resources :mypage, only: [:index]
  resources :logout, only: [:index]
end
