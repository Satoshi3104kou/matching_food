Rails.application.routes.draw do
  root to: 'foods#index'
  # get 'search', to: 'foods#search'
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
