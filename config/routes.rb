Rails.application.routes.draw do
  devise_for :users
  resources :recipes
  resources :foods
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "recipes#all"
  get '/shoppings', to: 'shoppings#index', as: 'shoppings'
  get '/all', to: 'recipes#all', as: 'public_recipes'
end
