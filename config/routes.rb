# frozen_string_literal: true

Rails.application.routes.draw do
  resources :bands
  resource :users, only: [:create]
  post '/login', to: 'users#login'
  get '/users', to: 'users#index'
end
