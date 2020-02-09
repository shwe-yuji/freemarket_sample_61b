Rails.application.routes.draw do
  get 'home/top'
  resources :users, only: [:show]
end
