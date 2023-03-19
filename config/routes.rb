Rails.application.routes.draw do
  resources :cats
  resources :subjects, except: %i[index]
  resources :contents, except: %i[index]
  root 'cats#index'
end
