Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get 'users', to: 'users/registrations#step1'
    get 'users', to: 'users/registrations#step2'
    post 'users', to: 'users/registrations#step2_regist'
  end

  root to: "home#top"
end
