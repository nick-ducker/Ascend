Rails.application.routes.draw do
  # get 'ticks/index'
  # get 'ticks/new'
  # get 'ticks/create'
  # get 'ticks/show'
  # get 'ticks/edit'
  # get 'ticks/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'ticks#index'

  # get 'users/new', to: 'users#new', as: :new_user
  # post 'users', to: 'users#create'
  resources :users

  get '/login', to: 'sessions#new', as: :new_session
  post '/login', to: 'sessions#create'

  delete '/logout', to: 'sessions#destroy'

  #get '/search', to: 'ticks#index'
  post '/ticksearch' , to: 'searches#ticksearch', as: :tick_search
  post '/workoutsearch' , to: 'searches#workoutsearch', as: :workout_search


  get '/help', to: 'staticpages#help', as: :help
  get '/training', to: 'staticpages#training', as: :training

  resources :ticks
  resources :workouts
  resources :plans
  resources :periods
  #resources :favorites
  post '/newfavorite', to: 'favorites#add', as: :add_favorite
  post '/removefavorite', to: 'favorites#remove', as: :remove_favorite
end
