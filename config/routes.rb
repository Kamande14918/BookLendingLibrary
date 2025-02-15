Rails.application.routes.draw do 
  resources :books do
    member do
      get 'borrow'
      get 'return'
    end
  end
  resources :borrowers, only: :show
  root 'books#index'
end
