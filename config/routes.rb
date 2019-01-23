Rails.application.routes.draw do
  devise_for :admins
  resources :deeds
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :deputies do
    resources :deeds
  end

  get '/homepage/index'
  get '/region', to: 'region#show'
  root 'homepage#index'

  resources :admins, only: [:show]

end
