PhotoSharingApp::Application.routes.draw do

  resources :ratings
  resources :tags
  resources :comments
  resources :albums
  devise_for :users
  resources :photos

  get '/user_page/:id', to: 'users#show'
  root to: "photos#index"
  
end
