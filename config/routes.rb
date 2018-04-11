Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :foods
  resources :storages
  resources :storages do
    resources :containers do
      resources :foods, only: [:create]
    end
  end
end
