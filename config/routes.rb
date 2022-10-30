Rails.application.routes.draw do
  root 'cats#index'
  resources :cats
  resources :subjects, only: %i[edit update destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
