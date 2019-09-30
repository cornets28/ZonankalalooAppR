Rails.application.routes.draw do
  resources :interests
  resources :sponsors
  resources :teams
  resources :home
  resources :partners
  resources :channels
  resources :discussions do
  resources :replies
  end

  root 'discussions#index'
  resources :likes, only: %i[create destroy]

  devise_for :users, controllers: { registrations: 'registrations' }
end
