Rails.application.routes.draw do
  root 'homepage#index'
  resources :assignments, except: [:new, :show, :edit, :index] do 
    resources :submissions, only: [:new, :create, :index] 
  end 
  get '/courses', to: 'courses#all_courses'
  resources :courses, only: [:index, :show] do 
    resources :assignments
  end 
  resources :users do 
    resources :courses 
    resources :submissions, only: [:show, :index] 
  end

  get '/auth/facebook/callback' => 'sessions#facebook_login'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  post '/assignments/:assignment_id/submissions', to: 'users#submissions'
  get '/users/:user_id/courses', to: 'users#index'
 
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
