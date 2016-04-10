Rails.application.routes.draw do
  resources :events
  resources :events
  resources :event_types
  resources :events
  get 'sessions/new'

  resources :users
  resources :events


  root :to => 'events#index'
  # SetupController
  get 'setup' => 'setup#index'
  post 'setup' => 'setup#index'
  get '/setup/confirm' => 'setup#confirm'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'

  put    'users/:id/set_admin' => 'users#set_admin', :as => :set_admin
  
end
