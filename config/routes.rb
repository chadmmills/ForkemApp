Rails.application.routes.draw do

  devise_for :users

  resources :mealbooks do
    resources :meals
  end

  resources :meal_assignments, only: :create

  get 'home/new'
  get 'home/index'

  authenticated :user do
    root to: 'mealbooks#index', as: :authenticated_root
  end


  root to: 'home#index'

end
