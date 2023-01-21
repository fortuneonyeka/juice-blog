Rails.application.routes.draw do
  devise_for :users
  get "search", to: "search#index"
  # get "show", to: "search#show"
 
  root "articles#index"

  resources :articles
  # resources :search
  
end
