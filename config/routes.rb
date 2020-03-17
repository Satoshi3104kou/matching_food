Rails.application.routes.draw do
  root to: 'foods#index'
  devise_for :users
  resources :users, only: [:show ]
  

  
  
  
  resources :foods do
    collection do
      get 'genre'
    end
  
    collection do
      get 'search'
    end
  end
end
