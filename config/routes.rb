Rails.application.routes.draw do
  # ALWAYS CLEAN UP FILES BEFORE SUBMISSION 
  # No unnecessary comments, no unnecessary new lines, etc.
  # (Good code should be explicit enough to not have comments!)

  # Might be more intuitive to name this "home#index"
  # and create a home controller and views/home/index.html.erb file
  # (This route isn't really an index page for users)

  root to: "cities#index"

  get "/user/new", to: "user#new", as: "new_user"
  post "/user/new", to: "user#create", as: "create_user"
  get "/user/:user_id", to: "user#show", as: "user"
  get "/user/:user_id/edit", to: "user#edit", as: "edit_user"
  patch "/user/:user_id", to: "user#update"

  get '/login', to: 'session#create'
  get '/logout', to: 'session#logout'

  # Highly recommend nesting routes using resources:
  # resources :cities do
  #   resources :posts do
  #     resources :comments
  #   end
  # end

  # This would create routes like the following:
  # /cities/:city_id
  # /cities/:city_id/posts
  # /cities/:city_id/posts/:post_id
  # /cities/:city_id/posts/:post_id/comments
  # /cities/:city_id/posts/:post_id/comments/:comment_id

  # This is recommended ^, because 
  # 1) It's intuitive (cities have posts, posts have comments) 
  # 2) You have all necessary params for requests in your URL (when you are, say, creating a new post, you have the city_id in the URL)
  # 3) It's short / easy to write
  # 4) It's widely considered best practice (mainly for the above reasons)

  get '/post/:post_id/show', to: 'post#show', as: "post"
  get '/post/:post_id', to: "post#edit", as: "edit_post"
  post '/post/:city_id', to: 'post#create', as: "create_post"
  patch '/post/:post_id/show', to: 'post#update', as: "update_post"
  delete '/post/:post_id/', to: 'post#destroy', as: "delete_post"

  get '/cities', to: "cities#index", as: "cities"
  get '/cities/:city_id/show', to: 'cities#show', as: "city"
end
