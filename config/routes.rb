Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    sessions: 'users/sessions'
  }
  root to: 'recipes#index'
  resources :users, only: [:index, :show]
  resources :recipes do
    collection do
      get 'search'
    end
  end
  post 'favorite/:id', to: 'favorites#create', as: 'create_favorite'
  delete 'favorite/:id', to: 'favorites#destroy', as: 'destroy_favorite'
  resources :favorites, only: [:index]

  resources :recipes do
    resources :comments, only: [:create, :destroy]
  end
end