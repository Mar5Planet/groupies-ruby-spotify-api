Rails.application.routes.draw do
  resources :songs
  resources :genres
  resources :comments
  resources :fan_groups
  resources :groups
  resources :fans
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end