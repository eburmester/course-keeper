Rails.application.routes.draw do
  root 'homepage#index'
  resources :completed_assignments
  resources :submissions
  resources :assignments
  resources :courses
  resources :users do
    resources :courses, only: [:index, :show, :new, :edit]
  end
  
  get '/login', to: 'homepage#login'
  post '/login', to: 'users#create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
