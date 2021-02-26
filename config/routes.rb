# frozen_string_literal: true

Rails.application.routes.draw do
  resources :notes
  resources :stocks, only: %i[index show]

  devise_for :users
  root 'home#index'
end
