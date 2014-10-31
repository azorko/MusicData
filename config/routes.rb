MusicApp::Application.routes.draw do
  root to: "bands#index" #always root to a GET request page
  resources :users, only: [:new, :create, :show]
  resources :sessions, only: [:create, :destroy, :new]
  
  resources :bands, only: [:index, :create, :new, :edit, :update, :destroy]
  resources :bands, only: [:show] do
    resources :albums, only: [:new]
  end
  resources :albums, only: [:create, :edit, :update, :destroy]
  resources :albums, only: [:show] do
    resources :tracks, only: [:new]
  end
  resources :tracks, only: [:create, :edit, :show, :update, :destroy]
  resources :notes, only: [:create, :destroy]
end
