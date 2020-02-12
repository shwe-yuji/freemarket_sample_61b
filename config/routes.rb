Rails.application.routes.draw do
  get 'products/new'
  get 'home/top'
  resources :users, only: [:show, :edit]
end
