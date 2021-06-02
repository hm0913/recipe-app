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

  resources :categories, only: [:show]
  resources :recipes do
    member do
      get 'research'
    end
  end

  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  post 'buy_item/:id', to: 'buy_items#create', as: 'create_buy_item'
  delete 'buy_item/:id', to: 'buy_items#destroy', as: 'destroy_buy_item'

end