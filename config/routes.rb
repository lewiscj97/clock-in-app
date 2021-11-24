Rails.application.routes.draw do
  resources :users, only: [:new, :create]
  root 'entries#entry_buttons'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  get '/welcome', to: 'sessions#welcome'
  get '/authorized', to: 'sessions#page_requires_login'
  get '/logout', to: 'sessions#logout'
  post '/entries', to: 'entries#create'
  get '/entries', to: 'entries#entry_buttons'
  get '/timesheet/:year/:week_number', to: 'timesheet#show', as: 'show_timesheet'
  post '/timesheet/week', to: 'timesheet#week'
  get '/timesheet/current', to: 'timesheet#current'
  get '/timesheet/:year/:week_number/:date/:entry_type', to: 'timesheet#edit_entry'
  patch '/timesheet/edit', to: 'timesheet#post_edit'
  post '/timesheet/edit', to: 'timesheet#post_edit'
  get '/about', to: 'application#about'
end
