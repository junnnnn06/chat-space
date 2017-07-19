Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, only: [:edit, :update, :index, :new]
  resources :groups, only: [:new, :create, :edit, :index, :update] do
    resources :messages, only: [:index, :create]
  end
end
