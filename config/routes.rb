Rails.application.routes.draw do

  devise_for :users

  resources :meals

  get 'home/new'
  get 'home/index'

  root 'home#index'

end
