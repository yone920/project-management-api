Rails.application.routes.draw do
  resources :employee_messages
  resources :mails
  resources :employee_tasks
  resources :tasks
  resources :projects
  resources :managers
  resources :employees
  resources :login, only: [:create]
  resources :signup, only: [:create]
  get '/profile', to: 'login#profile'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
