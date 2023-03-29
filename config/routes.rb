Rails.application.routes.draw do
  # devise_for :users
  devise_for :users, sign_out_via: [:get, :post]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  post 'recipes/:id/toggle', to: 'recipes#toggle', as: :toggle_recipe 
  root "users#index"
  resources :recipes, only: [:index, :show, :create, :new, :destroy]
  resources :foods, only: [:index, :new, :create, :destroy] 
  # resources :inventories, only: [:index, :show, :create, :new, :destroy] do
  #   resources :inventory_foods, only: [:create, :new]
  # end
  get '/inventories', to: 'inventories#index'
  get '/inventories/new', to: 'inventories#new'
  post '/inventories', to: 'inventories#create'
  get '/inventories/:id', to: 'inventories#show'
  delete '/inventories/:id', to: 'inventories#destroy'
  delete '/inventory_foods/:id', to: 'inventory_foods#destroy'
  get '/inventories/:id/inventory_foods/new', to: 'inventory_foods#new'
  post '/inventories/:id/inventory_foods', to: 'inventory_foods#create'
  # delete '/inventories/:id/inventory_foods/:id', to: 'inventory_foods#create'
end
