Rails.application.routes.draw do
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
