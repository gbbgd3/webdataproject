Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get 'about', to: 'about#index'

  root 'people#index'
  resources :people, only: %i[index show]
  resources :films, only: %i[index show]
  resources :species, only: %i[index show]
end
