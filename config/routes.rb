Rails.application.routes.draw do
  resources :fan_relationships
  resources :genre_songs
  resources :group_songs
  resources :group_genres
  resources :songs
  resources :genres
  resources :comments
  resources :fan_groups
  resources :groups
  resources :fans

  get "/signin" => "sessions#new", as: "signin"
  post "/login" => "sessions#create"

  post "/logout" => "sessions#destroy"

  root "welcome#home"

end
