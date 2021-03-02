Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'recipes#index'
  resources :users, only: [:index, :show]
  resources :recipes, only: [:index, :new, :create]
end