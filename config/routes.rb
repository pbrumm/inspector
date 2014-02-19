Inspector::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :sites
  resources :inspections do
  	resources :scores
  end
  
  resources :surveys 
  resources :items
  
  
end