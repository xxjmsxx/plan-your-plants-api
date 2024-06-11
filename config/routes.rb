Rails.application.routes.draw do
# login
post 'login', to: 'users#login'
post 'register', to: 'users#create'

resources :users, only: [:index, :show, :update, :destroy]
resources :gardens, only: [:index, :show, :create, :update, :destroy]
resources :plants, only: [:index, :show, :create, :update, :destroy]
resources :fertilizers, only: [:index, :show, :create, :update, :destroy]
resources :garden_plants, only: [:index, :show, :create, :update, :destroy]

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
