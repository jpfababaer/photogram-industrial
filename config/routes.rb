Rails.application.routes.draw do
  #Devise -> defines the root route of this project.
  root to: "photos#index"

  #Scaffolds -> defines the CRUD routes for each of the tables. 
  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  devise_for :users


end
