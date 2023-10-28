Rails.application.routes.draw do
  devise_for :users
  resources :recipes, only: [:index, :show, :new, :create, :destroy] do
    member do
      put 'toggle_public'
    end
    resources :recipe_foods, only: [:index, :show, :new, :create, :edit, :update, :destroy]
  end
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  resources :public_recipes, only: [:index]
  resources :shopping_list, only: [:index]
  root to: 'foods#index'
end
