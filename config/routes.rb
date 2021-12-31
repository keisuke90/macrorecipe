Rails.application.routes.draw do
  root to: 'toppages#index'
  get 'search', to: 'toppages#search'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'signup', to: 'users#new'
  resources :users, only: [:show, :create] do
    member do
      get :likes
    end
  end
  
  resources :recipes
  resources :favorites, only: [:create, :destroy]
  
  get '*path', controller: 'application', action: 'render_404'
end