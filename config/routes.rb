Rails.application.routes.draw do
  resources :products, only: :new
  get 'home/top'
  resources :users, only: [:show, :edit] do
    resources :credit_cards, only: [:show]
  end
end
