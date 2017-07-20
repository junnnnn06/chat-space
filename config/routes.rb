Rails.application.routes.draw do
  devise_for :users
  root 'groups#index'
  resources :users, except: [:index, :edit, :new, :update]
  resources :groups, only: [:new, :create, :edit, :index, :update] do
    resources :messages, only: [:index, :create]
  end
end
