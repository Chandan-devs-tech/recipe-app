Rails.application.routes.draw do
  resources :foods, only: [:index, :show, :new, :create, :destroy]
  devise_for :users
  root to: 'foods#index'
end
