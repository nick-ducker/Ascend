Rails.application.routes.draw do
  # get 'ticks/index'
  # get 'ticks/new'
  # get 'ticks/create'
  # get 'ticks/show'
  # get 'ticks/edit'
  # get 'ticks/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'ticks#index'

  get 'users/new', to: 'users#new', as: :new_user
  post 'users', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  resources :ticks
end
