Rails.application.routes.draw do

  resources :relationships
  get 'sessions/new'
  get 'users/new'
  delete 'logout' => 'sessions#destroy'

  get 'friends/add' => 'users#send_friend_request'
  get 'friends/accept' => 'users#accept_friend_request'

  resources :users
  resources :sessions, only: [:new, :create]
  resources :messages

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
