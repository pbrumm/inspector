Inspector::Application.routes.draw do
  root :to => "home#index"
  devise_for :users, :controllers => {:registrations => "registrations"}
  resources :users
  resources :sites do
    resources :inspections do
      resources :scores
    end
  end
  
  resources :surveys 
  resources :items
  

  # resources :generals, controller: 'scores', type: "General"
  # resources :videos, controller: 'scores', type: "Video"
  # resources :voids, controller: 'scores', type: "Void"
  
end