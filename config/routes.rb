Rails.application.routes.draw do
  resources :foods
  devise_for :users
  root to: 'foods#index'
end
