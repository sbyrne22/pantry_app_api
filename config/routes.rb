Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :foods, except: [:create]
  get 'fridge' => 'foods#fridge', :as => 'fridge'
  get 'freezer' => 'foods#freezer', :as => 'freezer'
  get 'pantry' => 'foods#pantry', :as => 'pantry'
  get 'box' => 'foods#box', :as => 'box'
  get 'can' => 'foods#can', :as => 'can'
  get 'bag' => 'foods#bag', :as => 'bag'
  # resources :fridge
  resources :storages
  resources :containers
  resources :storages, only: [:index, :show] do
    resources :containers, only: [:index, :show] do
      resources :foods, only: [:create]
    end
  end
end
