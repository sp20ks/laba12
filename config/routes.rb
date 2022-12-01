Rails.application.routes.draw do
  root 'elements#home', as: 'home'
  get 'elements/index', as: 'adding'
  get 'elements/result', as: 'result'
  get 'elements/show_all'
  get 'elements/find_seq', as: 'find'
  get 'elements/res_of_search'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
