Rails.application.routes.draw do
  devise_for :users
  root 'events#index'
  resources :events do
    resources :photos, only: [:create]
  end
  resources :users do
    resources :avatars, only: [:create]
  end
  resources :charges
  resources :attendances
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
