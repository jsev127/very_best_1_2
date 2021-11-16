Rails.application.routes.draw do
  root :to => "venues#index"
  resources :neighborhoods
  resources :bookmarks
  resources :dishes
  resources :cuisines
  resources :venues
  devise_for :users
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
