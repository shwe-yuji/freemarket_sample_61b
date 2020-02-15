Rails.application.routes.draw do
  devise_for :users, controllers: {
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
  end

  root to: "home#top"
  get 'home/top'
  resources :users, only: [:show, :edit]
end
