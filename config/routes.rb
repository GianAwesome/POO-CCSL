Rails.application.routes.draw do
  get 'sessions/new'

  resources :users
  resources :events


  root :to => 'users#index'
  # SetupController
  get 'setup' => 'setup#index'
  post 'setup' => 'setup#index'
  get '/setup/confirm' => 'setup#confirm'

  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  
end
