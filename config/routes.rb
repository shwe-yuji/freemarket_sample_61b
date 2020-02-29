Rails.application.routes.draw do
  root 'products#index'
  resources :products, except: :show
  get 'home/top'
  resources :users, only: [:show, :edit] do
    resources :credit_cards, only: [:show]
  end
  resources :home, only: [:show]
end
