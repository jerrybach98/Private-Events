Rails.application.routes.draw do
  get 'registrations/update'
  get 'users/home'
  get 'users/index'
  devise_for :users, controllers: {registrations: 'users/registrations'}
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :events
  resources :users
  resources :event_registrations

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  root "events#index"
end
