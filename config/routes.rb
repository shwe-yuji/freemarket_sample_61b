Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    # ビューの動作テスト用の仮のルーティング
    get 'registrations/1', to: 'users/registrations#step1'
    get 'registrations/2', to: 'users/registrations#step2'
    get 'registrations/3', to: 'users/registrations#step3'
    get 'registrations/4', to: 'users/registrations#step4'
    post 'registrations/5', to: 'users/registrations#create'
  end
  root to: "home#top"
end
