Rails.application.routes.draw do
  resources :neighborhoods
  resources :demographic_cards
  resources :permits
  resources :home
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/home' => 'home#show'
  post '/permits' => 'permits#create'
  get '/permits' => 'permits#index'
  get '/permits/neighborhoods' => 'permits#neighborhoodpermits'

  get '/neighborhoods' => 'neighborhoods#index'
  get '/neighborhood' => 'neighborhoods#show'
  post '/neighborhoods' => 'neighborhoods#create'

  post '/vacants' => 'vacants#create'
  get '/vacants' => 'vacants#index'
  get '/vacants/neighborhoods' => 'vacants#neighborhood_breakdown'
  # Defines the root path route ("/")
  # root "articles#index"
end
