Rails.application.routes.draw do
  resources :users
  resources :events

  get 'login' => 'users#index'
  # SetupController
  get 'setup' => 'setup#index'
  post 'setup' => 'setup#index'
  get '/setup/confirm' => 'setup#confirm'
  
end
