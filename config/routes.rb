Rails.application.routes.draw do
  root "photos#index"

  devise_for :users

  resources :likes
  resources :follow_requests
  resources :comments
  resources :photos

  #2 To create the tabbed interface, we must define a route for each of the desired tab we want to have in the User profile. 
  get ":username/liked" => "users#liked", as: :liked
  get ":username/feed" => "users#feed", as: :feed
  get ":username/followers" => "users#followers", as: :followers
  get ":username/following" => "users#following", as: :following

  #1 Rails can define the root of this route so we do NOT need the " / ". The rest is defining the Prefix for the tabbed interface.
  get ":username" => "users#show", as: :user


end
