Rails.application.routes.draw do
  resources :cats
  resources :subjects, except: %i[index show]
  resources :contents, except: %i[index show]
  root 'cats#index'
end
