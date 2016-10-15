Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :users, only: [:edit, :update]
  resources :groups, only: [:show] do
    resources :chats, only: [:index, :new, :create]
  end
end
