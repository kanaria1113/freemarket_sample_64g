Rails.application.routes.draw do

  get 'sessions/new'

  devise_for :users,
  controllers: {
    sessions: 'users/sessions'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end
  resources :signup do

  devise_for :users
  root to: 'index#index'
  
  resources :registration, only: [:index] do
    collection do
      get 'step1'
      get 'step2'
      get 'step3'
      get 'step4' # ここで、入力の全てが終了する
      get 'done' # 登録完了後のページ
    end
  end
  
  resources :card, only: [:index, :new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end

  resources :users, only: [:index,:show,:new]

  resources :mypage, only: [:index] do
    get "profile"
  end
  resources :logout, only: [:index]
  resources :items, only: [:index,:show,:edit,:destroy]
  resources :sell, only: [:index]
  resources :profile, only: [:index]
  resources :card, only: [:index] do
    collection do
      get 'mypage_card_input'
    end
  end
  resources :pribate, only: [:index]
  resources :confomation, only: [:index]

end
