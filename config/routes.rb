Rails.application.routes.draw do
  resources :venues
  resources :artists
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :users do
    resources :artists, only: [:index, :show, :create, :destroy, :delete, :met]
    resources :venues, only: [:index, :show, :create, :destroy]
  end

  get '/' => 'sessions#welcome'
  get    '/signup'  => 'users#new'
  post   '/signup'  => 'users#create'
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  get '/destroy' => 'sessions#destroy'

  post	'/users/1'	=>	'users_path(user)'
  post '/artists/new' => 'artists#new'
  post '/venues/new' => 'venues#new'
  post '/artists' => 'artists#create'
  post '/venues' => 'venues#create'
  get 'artist_destroy' => 'artists#destroy'
  post 'artist_destroy' => 'artists#destroy'
  get 'venue_destroy' => 'venues#destroy'
  post 'venue_destroy' => 'venues#destroy'
  post 'sessions/:id' => 'sessions#destroy'
  get 'artist/action' => 'artists#met'
  post 'users/:id' => 'users#show'




  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
