Rails.application.routes.draw do

  devise_for :users

  resources :meals

  get 'home/new'
  get 'home/index'

  authenticated :user do
    root to: 'meal_books#index', as: :authenticated_root
  end


  root to: 'home#index'

end
