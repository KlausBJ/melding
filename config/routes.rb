Rails.application.routes.draw do
  resources :situations
  #resources :cards
  resources :hands
  resources :bids
  resources :statements
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  get '/situations/create/:hand_id', to: 'situations#create'
  get '/situations/:id/bid', to: 'situations#bid'
  get '/situations/:id/bid/:bid_id', to: 'situations#bid'
end
