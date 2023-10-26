Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :new, :create, :destroy]
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  devise_for :users
  root to: 'foods#index'
end
