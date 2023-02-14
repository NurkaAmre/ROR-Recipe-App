Rails.application.routes.draw do
  resources :foods
  resources :recipes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "users#index"
  
  resources :users, only: [:index, :show]
    # resources :posts, only: [:index, :show, :new, :create, :destroy] do
       resources :recipes, only: [:index, :show, :create, :edit, :delete]
    #   resources :likes, only: [:create]
    # end
    
end