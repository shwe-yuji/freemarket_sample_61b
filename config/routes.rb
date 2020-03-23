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
  get 'products/done'
  get 'products/search'
  resources :products do
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'get_delivery_method', defaults: { format: 'json' }
      get 'get_size', defaults: { format: 'json' }
    end
  end

  # namespace :api do
  #   resources :products, only: :new, defaults: { format: 'json' }
  #   get '/products/delivery_method', to: 'products#delivery_method', defaults: { format: 'json' }
  # end
  root to: "products#index"
  get 'users/logout'
  resources :users, only: [:show, :edit] do
    resources :credit_cards, only: [:show]
  end
end