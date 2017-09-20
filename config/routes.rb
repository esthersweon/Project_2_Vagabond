Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "city#index"

  # new display form html page for creating new profile
  get "/users/new", to: "users#new", as: "new_user"
  # creating and insert into db
  post "/users", to: "users#create"
  # get -> showing individual profile
  get "/users/:id", to: "users#show", as: "user"

  #Sessions
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

  # #Libraries
  # get '/libraries', to: 'libraries#index'
  # get '/libraries/new', to: 'libraries#new', as: 'new_library'
  # post '/libraries', to: 'libraries#create'
  # get "/libraries/:id", to: "libraries#show", as: 'library'

end
