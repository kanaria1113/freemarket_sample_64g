Rails.application.routes.draw do
  devise_for :users
  root to: 'confomation#index'
  resources :mypage, only: [:index]
  resources :logout, only: [:index]
end
