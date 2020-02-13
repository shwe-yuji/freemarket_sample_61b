Rails.application.routes.draw do
  resources :products
  get 'home/top'
  resources :users, only: [:show, :edit]
end
