Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :workers, only: [:create, :index, :update, :destroy, :show]
  resources :reservations, only: [:create, :index, :update, :destroy, :show]
  resources :block_times, only: [:create, :index, :update, :destroy, :show]
  resources :work_days, only: [:create, :index, :update, :destroy, :show]

  resources :users, param: :_username
  post '/auth/login', to: 'authentication#login'
  get '/*a', to: 'application#not_found'

end
