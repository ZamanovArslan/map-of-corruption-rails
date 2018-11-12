Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :deeds, :deputies
  get 'homepage/index'

  root 'homepage#index'
end
