Rails.application.routes.draw do
  resources :partners
  resources :channels
  resources :discussions do
    resources :replies
  end

  root 'discussions#index'

  devise_for :users, controllers: { registrations: 'registrations' }
end
