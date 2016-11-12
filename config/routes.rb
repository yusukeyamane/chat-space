Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:index, :edit, :update]
  resources :groups, only: [:show, :new, :create, :edit, :update] do
    resources :chats, only: [:index, :new, :create]
  end
end
