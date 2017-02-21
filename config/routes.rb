Rails.application.routes.draw do

  get 'sessions/new'
  get 'users/new'
  delete 'logout' => 'sessions#destroy'

  resources :users
  resources :sessions, only: [:new, :create]
  resources :messages

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
