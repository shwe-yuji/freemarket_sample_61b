Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'user_regist', to: 'users/registrations#step1'
    post 'user_regist', to: 'users/registrations#step1_regist'
    get 'phone_regist', to: 'users/registrations#step2'
    post 'phone_regist', to: 'users/registrations#step2_regist'
    get 'address_regist', to: 'users/registrations#step3'
    post 'address_regist', to: 'users/registrations#step3_regist'
    get 'creditcard_regist', to: 'users/registrations#step3'
    post 'creditcard_regist', to: 'users/registrations#step3_regist'
  end

  root to: "home#top"
end
