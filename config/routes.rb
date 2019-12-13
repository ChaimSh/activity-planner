Rails.application.routes.draw do
 
  
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  
    
  
  resources :activities do
    resources :events, only: [:index, :new, :create]
  end
  #see if events should be a stand alone or always be nested under locations.
  resources :events
  resources :locations do
    resources :events
  end
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
