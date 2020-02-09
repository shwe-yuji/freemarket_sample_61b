Rails.application.routes.draw do
  get 'home/top'
  get 'users/show'
  # resources :users, only: [:show]
end
