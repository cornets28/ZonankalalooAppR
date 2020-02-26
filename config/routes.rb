# frozen_string_literal: true

Rails.application.routes.draw do
  resources :serials
  resources :scenes
  resources :jobs
  root 'discussions#index'
  devise_for :users, controllers: { registrations: 'registrations' }
  resources :discussions do
    resources :replies
  end
  resources :interests
  resources :sponsors
  resources :teams
  resources :home
  resources :partners
  resources :channels
  resources :likes, only: %i[create destroy]
end
