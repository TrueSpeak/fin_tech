Rails.application.routes.draw do
  resources :notes
  resources :stocks, only: [:index, :show]

  devise_for :users
  root 'home#index'
end
