Rails.application.routes.draw do
  # get 'ticks/index'
  # get 'ticks/new'
  # get 'ticks/create'
  # get 'ticks/show'
  # get 'ticks/edit'
  # get 'ticks/delete'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'ticks#index'

  resources :ticks
end
