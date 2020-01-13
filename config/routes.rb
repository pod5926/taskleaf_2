Rails.application.routes.draw do
  #セッション
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  #アドミン
  namespace :admin do
    resources :users
  end
  #タスク
  root to: 'tasks#index'
  resources :tasks do
    post :confirm, action: :confirm_new, on: :new
    post :import, on: :collection
  end
end
