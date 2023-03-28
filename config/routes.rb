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
end
