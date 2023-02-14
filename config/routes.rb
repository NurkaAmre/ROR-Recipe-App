Rails.application.routes.draw do
  resources :recipes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "users#index"
  
  resources :users, only: [:index, :show]
    # resources :posts, only: [:index, :show, :new, :create, :destroy] do
    #   resources :comments, only: [:create, :new, :destroy]
    #   resources :likes, only: [:create]
    # end
    
end