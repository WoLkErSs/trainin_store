Rails.application.routes.draw do

  devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }

  root 'books#index'

  resources :books, only: %i[show index]
end
