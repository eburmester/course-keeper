Rails.application.routes.draw do
  resources :completed_assignments
  resources :submissions
  resources :assignments
  resources :courses
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
