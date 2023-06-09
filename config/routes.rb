Rails.application.routes.draw do
  root to: redirect('https://documenter.getpostman.com/view/13303112/2s93XvWkJt')
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  post 'auth/login', to: 'authentication#authenticate'
  post 'signup', to: 'users#create'
  get '/deposits', to: 'transactions#deposits'
  get '/transfers', to: 'transactions#transfers'
  get '/balance', to: 'account#balance'
  resources :notifications, only: [:index]
  resources :reports, only: [:index]
  resources :make_payments, only: [:create]
  resources :mpesa_deposits, only: [:create]
  resources :transactions, only: [:index]
end
