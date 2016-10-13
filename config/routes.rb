Rails.application.routes.draw do
  devise_for :users
  root "groups#index"
  resources :groups, only: [:show] do
    resources :chats, only: [:index, :new, :create]
  end
end
