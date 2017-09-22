Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: "cities#index"

  # new display form html page for creating new profile
  get "/user/new", to: "user#new", as: "new_user"
  # creating and insert into db
  post "/user/new", to: "user#create", as: "create_user"
  # get -> showing individual profile
  get "/user/:user_id", to: "user#show", as: "user"
  get "/user/:user_id/edit", to: "user#edit", as: "edit_user"
  patch "/user/:user_id", to: "user#update"
  #Sessions
  get '/login', to: 'session#create'
  get '/logout', to: 'session#logout'
  post '/session', to: 'session#create'

  # Posts routes
  get '/post/:post_id/show', to: 'post#show', as: "post"
  get '/post/:post_id', to: "post#edit", as: "edit_post"
  post '/post/:city_id', to: 'post#create', as: "create_post"
  patch '/post/:post_id/show', to: 'post#update', as: "update_post"
  delete '/post/:post_id/', to: 'post#destroy', as: "delete_post"

  # index -> Homepage showing list of cities to select
  get '/cities', to: "cities#index", as: "cities"
  # show specific city
  get '/cities/:city_id/show', to: 'cities#show', as: "city"
end
