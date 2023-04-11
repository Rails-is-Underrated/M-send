Rails.application.routes.draw do
  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get '/deposits', to: 'transactions#deposits'
  get '/transfers', to: 'transactions#transfers'
  get '/balance', to: 'account#balance'
  resources :make_payments, only: [:create]
  resources :mpesa_deposits, only: [:create]
  resources :transactions, only: [:index]
end
