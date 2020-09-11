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
  get "/fans/:id/follow" => "fans#follow", as: "follow"
  get "/fans/:id/unfollow" => "fans#unfollow", as: "unfollow"

  get "/groups/:id/add_fan" => "groups#add_fan", as: "add"
  get "/groups/:id/remove_fan" => "groups#remove_fan", as: "remove"

  
  post "/login" => "sessions#create"

  post "/logout" => "sessions#destroy"

  root "welcome#home"

end
