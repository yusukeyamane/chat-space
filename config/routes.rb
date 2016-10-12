Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :chats, only: [:show, :new, :create]
end
