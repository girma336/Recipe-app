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
  resources :public_recipes, only: [:index]
  resources :public_recipes, only: [:index, :create, :new, ]
  resources :inventories, only: [:update]
  # end
  get '/inventories', to: 'inventories#index'
  get '/inventories/new', to: 'inventories#new'
  post '/inventories', to: 'inventories#create'
  get '/inventories/:id', to: 'inventories#show'
  delete '/inventories/:id', to: 'inventories#destroy'
  delete '/inventory_foods/:id', to: 'inventory_foods#destroy'
  get '/inventories/:id/inventory_foods/new', to: 'inventory_foods#new'
  post '/inventories/:id/inventory_foods', to: 'inventory_foods#create'

  delete '/recipe_foods/:id', to: 'recipe_foods#destroy'
  get '/recipes/:id/recipe_foods/new', to: 'recipe_foods#new'
  post '/recipes/:id/recipe_foods', to: 'recipe_foods#create'
  get '/recipe_foods/:id', to: 'recipe_foods#show'


  
  resources :shopping_lists, only: [:index, :create]
  
end
