PhotoSharingApp::Application.routes.draw do

  resources :ratings
  resources :tags
  resources :comments, except: [:create, :new, :edit, :update]
  resources :albums
  devise_for :users
  resources :photos do
    resources :comments, only: [:create, :new, :edit, :update]
  end
  resources :users, only: [:show, :edit, :update]
  
  root to: "photos#index"

end
