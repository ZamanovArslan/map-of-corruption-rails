Rails.application.routes.draw do
  devise_for :admins
  resources :deeds
  resources :admins, only: [:show]
  resources :deputies do
    resources :deeds
  end

  get "/homepage/index"
  get "/region", to: "region#show"
  root "homepage#index"
end
