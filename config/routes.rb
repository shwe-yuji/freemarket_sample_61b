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
  get 'brands/group/:id', to: 'brands#group_show', as: :brand_group

  resources :brands, only: [:show] do
    get ':id', to: 'brands#category'
  end

  get 'products/done'
  get 'products/search'
  resources :products
  root to: "products#index"
  get 'users/logout'

  resources :users, only: [:show, :edit] do
    resources :credit_cards, only: [:show]
    resources :products,only: [:edit, :update]
    get'listing', to: 'users#listing'
  end

  get 'products/search'
  resources :products do
    member do
      post 'buy', to: 'credit_cards#buy'
      get 'done'
    end
  end

end
