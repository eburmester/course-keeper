Rails.application.routes.draw do
  root 'homepage#index'
  resources :completed_assignments
  resources :submissions
  resources :assignments
  resources :courses
  resources :users
  
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'

  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
