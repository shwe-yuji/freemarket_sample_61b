Rails.application.routes.draw do
  root 'products#index'
  resources :products, except: :show
  get 'home/top'
  resources :users, only: [:show, :edit]
end
