Rails.application.routes.draw do

  namespace :api do
    # Current_user
    get '/current_user_info', to: 'users#current_user_info'
    get '/is_logged_in', to: 'sessions#is_logged_in?'

    # Session actions
    post 'login', to: 'sessions#create'
    delete 'logout', to: 'sessions#destroy'

    resources :users, only: [:index, :create, :show, :update, :destroy]
    resources :gardens, only: [:index, :show, :create, :update, :destroy]
    resources :plants, only: [:index, :show, :create, :update, :destroy]
    resources :fertilizers, only: [:index, :show, :create, :update, :destroy]
    resources :garden_plants, only: [:index, :show, :create, :update, :destroy]
  end


  get "up" => "rails/health#show", as: :rails_health_check
end
