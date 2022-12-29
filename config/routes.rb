# frozen_string_literal: true

Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users

  root 'sessions#new', as: 'home'

  get 'elements/index', as: 'adding'
  get 'elements/result', as: 'result'

  get 'users/index', as: 'all'
  get 'users/new', as: 'new_us'

  get 'sessions/destroy', as: 'exit'
  get 'sessions/new', as: 'new_sess'
  get 'sessions/create'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
