Rails.application.routes.draw do
  get 'mpesa_deposits/create'
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get 'all_transactions', to: 'transactions#index'
  post 'transactions', to: 'transactions#create'
  resources :mpesa_transfers, only: [:create]
  resources :mpesa_deposits, only: [:create]
end
