Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "city#index"

  # new display form html page for creating new profile
  get "/user/new", to: "user#new", as: "new_user"
  # creating and insert into db
  post "/user", to: "user#create", as: "create_user"
  # get -> showing individual profile
  get "/user/:user_id", to: "user#show", as: "user"
  get "/user/:user_id/edit", to: "user#edit", as: "edit_user"
  patch "/user/:user_id", to: "user#update"
  #Sessions
  get '/login', to: 'session#create'
  get '/logout', to: 'session#logout'
  post '/session', to: 'session#create'

  # Posts routes

  # index -> Homepage showing list of cities to select
  # get '/cites', to: 'cities#index'
  # # show specific city
  # get '/cities/:id/show', to: 'cities#show', as: "city"
  # get "/libraries/:id", to: "libraries#show", as: 'library'

  get '/cities', to: "city#index", as: "cities"
end
