Rails.application.routes.draw do
 
  
  root 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create'
  get '/auth/google_oauth2/callback' => 'sessions#omniauth'
  get 'events/number_of_located_events' => 'events#number_of_located_events'
  
  resources :activities do
    resources :events, only: [:index, :new, :create]
  end
  #see if events should be a stand alone or always be nested under locations.
  resources :events
  resources :locations do
    resources :events
  end
  resources :users
  # resources :categories, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
