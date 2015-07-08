Rails.application.routes.draw do

  devise_for :users

  resources :meals
  resources :mealbooks

  get 'home/new'
  get 'home/index'

  authenticated :user do
    root to: 'mealbooks#index', as: :authenticated_root
  end


  root to: 'home#index'

end
