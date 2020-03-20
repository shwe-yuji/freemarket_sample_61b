Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  devise_scope :user do
    get 'user_regist', to: 'users/registrations#step1'
    post 'user_regist', to: 'users/registrations#step1_regist'
    get 'phone_regist', to: 'users/registrations#step2'
    post 'phone_regist', to: 'users/registrations#step2_regist'
    get 'phone_confirm', to: 'users/registrations#phone_confirm'
    post 'phone_confirm', to: 'users/registrations#phone_confirm_input'
    get 'destination_regist', to: 'users/registrations#step3'
    post 'destination_regist', to: 'users/registrations#step3_regist'
    get 'creditcard_regist', to: 'users/registrations#step4'
    post 'creditcard_regist', to: 'users/registrations#step4_regist'
    get 'registed', to: 'users/registrations#finish_regist'
  end

  resources :categories, only: [:index, :show]
  
  root to: "products#index"
  get 'users/logout'

  resources :users, only: [:show, :edit] do
    resources :credit_cards, only: [:new, :create, :show, :destroy]
  end

  get 'products/search'

  resources :products do
    member do
      post 'purchase', to: 'credit_cards#purchase'
      get 'done'
      get 'buy'
      post 'buy', to: 'credit_cards#buy'
    end
  end

end