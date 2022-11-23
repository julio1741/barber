Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :workers, only: [:create, :index, :update, :destroy, :show] do
    collection do
      post 'available_hours', action: :available_hours, as: :available_hours
    end
  end
  resources :reservations, only: [:create, :index, :update, :destroy, :show] do
    collection do
      post 'by_user/', action: :by_user, as: :by_user
    end
  end
  resources :block_times, only: [:create, :index, :update, :destroy, :show]
  resources :work_days, only: [:create, :index, :update, :destroy, :show]
  resources :services

  resources :users
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'api#not_found'

  namespace :guest do
    resources :reservations, controller: '/guest_reservations', only: [:create, :update, :index] do
      collection do
        get 'by_user/:user_id', action: :by_user, as: :by_user
      end
    end
  end

end
