Rails.application.routes.draw do 
  resources :books do
    member do
      get 'borrow'
      patch 'borrow', to: 'books#borrow'
      get 'return'
    end
  end
  resources :borrowers, only: [:show, :index] # Add :index if you want to list all borrowers
  root 'books#index'
end
