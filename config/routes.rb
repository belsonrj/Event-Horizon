Rails.application.routes.draw do
  resources :venues
  resources :artists
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :users do
    resources :artists, only: [:index, :show]
    resources :venues, only: [:index, :show]
  end

  get '/' => 'sessions#welcome'
  get    '/signup'  => 'users#new'
  post   '/signup'  => 'users#create'
  get    '/login'   => 'sessions#new'
  post   '/login'   => 'sessions#create'
  delete '/logout'  => 'sessions#destroy'
  post	'/users/1'	=>	'users_path(user)'
  post '/artists' => 'artist#create'
  get '/destroy' => 'sessions#destroy'
  


  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
