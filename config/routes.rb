Rails.application.routes.draw do
  resources :foods
  resources :recipes
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  root "foods#index"
  
  resources :users, only: [:index, :show]
    resources :recipes, only: [:index, :show, :create, :edit, :delete]  
end