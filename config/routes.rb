Rails.application.routes.draw do
  resources :products, only: :new do
  end
  get 'home/top'
  resources :users, only: [:show, :edit]
end
