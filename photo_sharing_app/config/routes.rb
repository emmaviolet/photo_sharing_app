PhotoSharingApp::Application.routes.draw do

  resources :ratings


  resources :tags


  resources :comments


  resources :albums


  devise_for :users

  resources :photos

  root to: "photos#index"
  
end
