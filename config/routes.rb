Rails.application.routes.draw do
  resources :books do
    resources :lendings do
      member do
        patch 'borrow'
        patch 'return'
        get 'return' # Add this line to support GET requests for the return action
      end
    end
  end

  resources :borrowers, only: [:index, :show]

  root 'books#index'
end
