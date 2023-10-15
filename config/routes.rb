Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root 'people#index'
  get 'about', to: 'about#index'
  get 'people/search', to: 'people#search'
  get 'films/search', to: 'films#search'

  resources :people, only: %i[index show]
  resources :films, only: %i[index show]
  resources :species, only: %i[index show]

  get '/search_redirect', to: 'search#search_redirect'
end
