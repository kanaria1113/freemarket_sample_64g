Rails.application.routes.draw do
  devise_for :users
  root to: 'index#index'
  
  resources :registration, only: [:index] do
    collection do
      get 'registration_information'
      get 'registration_active'
      get 'registration_address'
      get 'registration_payment'
      get 'registration_complete'
    end
  end
  root to: 'index#index'
  resources :mypage, only: [:index]
  resources :logout, only: [:index]
  resources :sell, only: [:index]
  resources :card, only: [:index] do
    collection do
      get 'mypage_card_input'
    end
  end

  get "login" => "index#login"

end
