Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "city#index"

  # new display form html page for creating new profile
  get "/users/new", to: "users#new", as: "new_user"
  # creating and insert into db
  post "/users", to: "users#create"
  # get -> showing individual profile
  get "/users/:user_id", to: "users#show", as: "user"
  get "/users/:user_id/edit", to: "user#edit", as: "edit_user"
  patch "/users/:user_id", to: "user#update"
  #Sessions
  get '/login', to: 'session#new'
  get '/logout', to: 'session#destroy'
  post '/session', to: 'session#create'

  # Posts routes

  # index -> Homepage showing list of cities to select
  # get '/cites', to: 'cities#index'
  # # show specific city
  # get '/cities/:id/show', to: 'cities#show', as: "city"
  # get "/libraries/:id", to: "libraries#show", as: 'library'

  get '/cities', to: "cities#index", as: "cities"
end
