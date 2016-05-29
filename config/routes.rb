Rails.application.routes.draw do
  devise_for :users
  resources :foods

  resources :diaries

  root to: 'diaries#index'
end
