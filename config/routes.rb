Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'serchs/search'
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  get 'items/new'
  get 'items/create'
  get 'items/show'
  get 'items/edit'
  get 'items/destroy'
  get 'users/index'
  get 'users/show'
  get 'users/new'
  get 'users/create'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'users#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users do
    member do
      get :likes
    end
  end

  
  resources :items
  resources :relationships, only: [:create, :destroy]
  
  get 'search', to: 'searchs#search'
end
