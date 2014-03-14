Inspector::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :sites
  resources :inspections 
  
  resources :surveys 
  resources :items
  resources :scores

  # resources :generals, controller: 'scores', type: "General"
  # resources :videos, controller: 'scores', type: "Video"
  # resources :voids, controller: 'scores', type: "Void"
  
end