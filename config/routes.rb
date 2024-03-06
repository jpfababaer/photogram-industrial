Rails.application.routes.draw do
  root to: "photos#index"
  
  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
