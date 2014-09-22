PhotoSharingApp::Application.routes.draw do

  resources :ratings
  resources :tags
  resources :comments
  resources :albums
  devise_for :users
  resources :photos
  resources :users, only: [:show, :edit, :update]
  
  get '/search', to: 'home#index'
  root to: "photos#index"
  
end
