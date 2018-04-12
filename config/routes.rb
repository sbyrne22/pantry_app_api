Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :foods, except: [:create]
  resources :storages
  resources :containers
  resources :storages, only: [:index, :show] do
    resources :containers, only: [:index, :show] do
      resources :foods, only: [:create]
    end
  end
end
