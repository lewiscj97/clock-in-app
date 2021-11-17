Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root 'sessions#welcome'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get '/authorized', to: 'sessions#page_requires_login'
  get '/logout', to: 'sessions#logout'
  post '/entries', to: 'entries#create'
  get '/entries', to: 'entries#entry_buttons'
  get '/timesheet', to: 'timesheet#index'
  get '/timesheet/:year/:week_number', to: 'timesheet#show'
  post '/timesheet/week', to: 'timesheet#week'
end
