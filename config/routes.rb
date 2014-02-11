Inspector::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :sites do
    resources :inspections
  end
  resources :surveys
  
end