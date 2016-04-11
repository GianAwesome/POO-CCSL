Rails.application.routes.draw do
  get 'events/calendar' => 'events#calendar', :as => :calendar
  resources :event_types
  resources :events
  get 'sessions/new'
  get 'next' => 'events#next'
  get 'next3' => 'events#next3'

  resources :users

  root :to => 'events#index'
  # SetupController
  get 'setup' => 'setup#index'
  post 'setup' => 'setup#index'
  get '/setup/confirm' => 'setup#confirm'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  put    'users/:id/set_admin' => 'users#set_admin', :as => :set_admin
  put    '/calendar_events' => 'events#calendar_events'
  
end
